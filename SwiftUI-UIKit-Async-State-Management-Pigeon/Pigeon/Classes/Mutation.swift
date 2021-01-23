//
//  Mutation.swift
//  Pigeon
//
//  Created by Fernando Martín Ortiz on 23/08/2020.
//  Copyright © 2020 Fernando Martín Ortiz. All rights reserved.
//

import Foundation
import Combine

/// Mutations are central to Pigeon concepts.
/// A mutation is a type that encapsulates an operation that could mutate
/// server data.
/// As it can mutate server data, it's also responsible for invalidating
/// current queries.
public final class Mutation<Request, Response>: ObservableObject {
    public typealias State = QueryState<Response>
    public typealias QueryFetcher = (Request) -> AnyPublisher<Response, Error>
    
    @Published public var state = State.idle
    private let fetcher: QueryFetcher
    private var cancellables = Set<AnyCancellable>()
    
    public init(fetcher: @escaping QueryFetcher) {
        self.fetcher = fetcher
    }
    
    public func execute(
        with request: Request,
        onSuccess: @escaping (
            Response,
            (QueryKey, QueryInvalidator.Parameters) -> Void
        ) -> Void = { _, _ in }
    ) {
        state = .loading
        fetcher(request)
            .sink(
                receiveCompletion: { (completion: Subscribers.Completion<Error>) in
                    switch completion {
                    case let .failure(error):
                        self.state = .failed(error)
                    case .finished:
                        break
                    }
                },
                receiveValue: { (response: Response) in
                    self.state = .succeed(response)
                    let invalidator = QueryInvalidator()
                    onSuccess(response, invalidator.invalidateQuery)
                }
            )
            .store(in: &cancellables)
    }
}
