//
//  LibraryUser.swift
//  homework1
//
//  Created by Ilvina on 02.07.2026.
//

import Foundation
class LibraryUser {
    let name: String
    let id: String
    
    init(name: String, id: String) {
        self.name = name
        self.id = id
    }
    
    func maxBooksCount() -> Int {
        return 0
    }
    
    func printInfo() {
        print("Пользователь: \(name)")
        print("Максимальное количество книг: \(maxBooksCount())")
    }
}
