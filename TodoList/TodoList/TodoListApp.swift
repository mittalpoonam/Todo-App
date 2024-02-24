//
//  TodoListApp.swift
//  TodoList
//
//  Created by poonam mittal on 19/02/24.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
           
        }
    }
}
/*
 
 MVVM Architecture
 
 Model -> data point
 View  -> UI
 View Model -> this is the observable object or class that manages the models or data for view, our data is managed in view model
 
 view model is the main component of the mvvm because in mvvm on one side we have the view which is all the ui components
 and on other side we have the model with the data points and in the middle we have the view model
 view model is going to be connected to our view and its going to hold all the data for the view, data is the bunch of models
 
 view model contains all the logic for creating, reading, updating and deleting data
 
 */
