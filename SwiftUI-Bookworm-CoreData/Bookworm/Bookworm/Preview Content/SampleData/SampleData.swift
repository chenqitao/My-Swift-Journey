//
//  SampleData.swift
//  Bookworm
//
//  Created by CypherPoet on 11/16/19.
// ✌️
//

#if DEBUG
import SwiftUI
import CoreData

enum SampleMOC {
    static let `default` = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    static let appDelegate = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
}

enum SampleBooks {
    static let book1: Book = {
        var book = Book(context: SampleMOC.default)

        book.title = "Economics in One Lesson"
        book.author = "Henry Hazlitt"
        book.id = .init()
        book.genre = .economics
        book.rating = 5
        book.reviewText = "It was fantastic."

        return book
    }()

    static let book2: Book = {
        var book = Book(context: SampleMOC.default)
        
        book.title = "The Silmarillion"
        book.author = "J. R. R. Tolkien"
        book.id = .init()
        book.genre = .fantasy
        book.rating = 5
        book.reviewText = "Amazing."
        book.reviewDate = Date()
        
        return book
    }()
    
    static let book3: Book = {
        var book = Book(context: SampleMOC.default)
        
        book.title = "The Character of Physical Law"
        book.author = "Richard Feynman"
        book.id = .init()
        book.genre = .science
        book.rating = 5
        book.reviewText = "The Best Book Ever."
        book.reviewDate = Date()
        
        return book
    }()
    
    static let oneStar: Book = {
        var book = Book(context: SampleMOC.default)
        
        book.title = "Learn to Code in 5 Minutes"
        book.author = "Foo Bar"
        book.id = .init()
        book.genre = .softwareEngineering
        book.rating = 1
        book.reviewText = "Ended on an abrupt cliffhanger after printing \"Hello world\"."
        book.reviewDate = Date()
        
        return book
    }()
    
    static let `default`: [Book] = [
        book1,
        book2,
        book3,
    ]
}

enum SampleAppState {
    static let `default` = AppState()
}

enum SampleStore {
    static let `default` = AppStore(initialState: SampleAppState.default, appReducer: appReducer)
}
#endif
