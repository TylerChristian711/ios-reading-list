//
//  BookController .swift
//  ReadingList
//
//  Created by Lambda_School_Loaner_218 on 11/12/19.
//  Copyright © 2019 Lambda_School_Loaner_218. All rights reserved.
//

import Foundation

class BookController {
    
    var books: [Book] = []
    
    var readBooks: [Book] {
        let read = books.filter{$0.hasBeenRead == true}
        return read
    }
    
    var unreadBooks: [Book] {
        let unread = books.filter{$0.hasBeenRead == false}
        return unread
    }
    
   @discardableResult func createBook(with title: String, reasonToRead: String) -> Book {
        let book = Book(title: title, reasonToRead: reasonToRead)
        books.append(book)
        saveToPersistentStore()
        
        return book
    }
    
    func deleteBook(name: String) {
        for book in books {
            if book.title == name {
                if let index = books.index(of: book) {
                    books.remove(at: index)
                    saveToPersistentStore()
                }
            }
        }
    }
    
    
    
    
    
    var readingListURL: URL? {
      let fileManager = FileManager.default
        guard let documentDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        
        return documentDir.appendingPathComponent("book.plist")
    }
    
    func saveToPersistentStore() {
        
        let encoder = PropertyListEncoder()
        
        do {
            let booksData = try encoder.encode(books)
            
            guard let fileURL = readingListURL else { return }
            
            try booksData.write(to: fileURL)
            
        } catch {
            print("Error saving book \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        
        let fileManager = FileManager.default
        
        guard let fileURL = readingListURL,
            fileManager.fileExists(atPath: fileURL.path) else { return }
        
        
        do {
           let bookData = try Data(contentsOf: fileURL)
           let decoder = PropertyListDecoder()
            books = try decoder.decode([Book].self, from: bookData)
        } catch {
            print("Error loading book data \(error)")
        }
    }
}
