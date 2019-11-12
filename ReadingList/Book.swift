//
//  Book.swift
//  ReadingList
//
//  Created by Lambda_School_Loaner_218 on 11/12/19.
//  Copyright © 2019 Lambda_School_Loaner_218. All rights reserved.
//

import Foundation
struct Book: Equatable, Codable {
    let title: String
    let reasonToRead: String
    let hasBeenRead: Bool
    
    init(title: String, reasonToRead: String, hasBeenRead: Bool = false) {
        self.title = title
        self.reasonToRead = reasonToRead
        self.hasBeenRead = hasBeenRead
    }
}
