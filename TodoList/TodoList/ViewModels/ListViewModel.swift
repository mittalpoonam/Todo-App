//
//  ListViewModel.swift
//  TodoList
//
//  Created by poonam mittal on 19/02/24.
//

import Foundation

/*
 CRUD FUNCTIONS are there in ViewModel
 */
class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet{
            saveItems()
        }
    }
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        
//        let newItems: [ItemModel] = [ItemModel(title: "This is the first item!!", isCompleted: false), ItemModel(title: "This is the second Item!!", isCompleted: true) , ItemModel(title: "This is the third!!", isCompleted: false)]
//
//        items.append(contentsOf: newItems)
        
        guard let data = UserDefaults.standard.value(forKey: itemsKey),
              let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data as! Data)
        else{return}
        
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String){
        items.append(ItemModel(title: title, isCompleted: false))
    }
    
    func updateItem(item: ItemModel){
//        if let index = items.firstIndex { existingItem in
//            return existingItem.id == item.id
//        }{
//            //code
//        }
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updateCompletion()
        }
        
        // if we already have the id then it doesn't create the new one
    }

    func saveItems (){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
   

}
