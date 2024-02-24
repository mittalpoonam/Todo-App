//
//  ListView.swift
//  TodoList
//
//  Created by poonam mittal on 19/02/24.
//

import SwiftUI

struct ListView: View {

    @EnvironmentObject var listViewModel: ListViewModel
    
    
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty {
                NoItemsView()
            }else{
                List {
                    ForEach(listViewModel.items) { item in
                        
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.updateItem(item: item)
                                }
                              
                            }
                    }
                    .onDelete (perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Todo List 🔖")
        .navigationBarItems(leading: EditButton(),
                            trailing: NavigationLink(destination: AddView(), label: {Text("Add")})
        
        )
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}


