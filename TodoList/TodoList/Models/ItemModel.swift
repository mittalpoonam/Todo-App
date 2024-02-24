//
//  ItemnModel.swift
//  TodoList
//
//  Created by poonam mittal on 19/02/24.
//

import Foundation

// immutable structs :- creating immutable structs are the good practice
struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool){
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel{
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
