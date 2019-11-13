//
//  Book.swift
//  ReadingList
//
//  Created by Lambda_School_Loaner_218 on 11/12/19.
//  Copyright © 2019 Lambda_School_Loaner_218. All rights reserved.
//

import Foundation

var bookController = BookController()


struct Book: Equatable, Codable {
    var title: String
    var reasonToRead: String
    var hasBeenRead: Bool
    
    init(title: String, reasonToRead: String, hasBeenRead: Bool = false) {
        self.title = title
        self.reasonToRead = reasonToRead
        self.hasBeenRead = hasBeenRead
    }
    
    mutating func updateHasBeenRead() {
        hasBeenRead = !hasBeenRead
        bookController.saveToPersistentStore()
    }
    
    mutating func updateReasonOrTitle(newTitle: String = "", reason: String = "") {
        if !newTitle.isEmpty {
            title = newTitle
        }
        if !reason.isEmpty {
            reasonToRead = reason
        }
    }
}
