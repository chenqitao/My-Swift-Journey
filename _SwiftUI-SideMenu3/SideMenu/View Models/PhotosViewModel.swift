//
//  HomeViewModel.swift
//  SideMenu
//
//  Created by Vid on 12/07/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI
import Combine

class PhotosViewModel: ObservableObject {
    typealias ViewModelSubject = PassthroughSubject<PhotosViewModel, Never>
    
    // MARK: - Properties
    
    private lazy var apiService = APIService<[Photo]>()
    
    private var cancellables = [AnyCancellable]()
    
    @Published var state: ViewState<[Photo]> = .completedWithNoData
    
    deinit {
        cancel()
    }
    
    // MARK: - Public
    
    func fetchPhotos(orderBy: PhotosEndPoint.OrderBy) {
        self.state = .loading
        
        let photosEndPoint = PhotosEndPoint.photos(orderBy: orderBy)
        let responsePublisher = self.apiService.fetchPhotosSignal(endPoint: photosEndPoint)

        let responseStream = responsePublisher
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished: break
                case .failure(let error):
                    self?.state = .failed(error: error.message)
                }
            }, receiveValue: { [weak self] photos in
                if photos.count > 0 {
                    self?.state = .completed(response: photos)
                } else {
                    self?.state = .completedWithNoData
                }
        })
        
        // collect AnyCancellable subjects to discard later when `PhotosViewModel` life cycle ended
        self.cancellables += [responseStream]
    }
    
    func cancel() {
        self.cancellables.forEach { (cancellable) in
            cancellable.cancel()
        }
        self.cancellables.removeAll()
    }
    
}
