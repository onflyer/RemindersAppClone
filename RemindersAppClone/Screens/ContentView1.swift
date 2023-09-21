//
//  ContentView1.swift
//  RemindersAppClone
//
//  Created by Aleksandar Milidrag on 9/20/23.
//

import SwiftUI
import SwiftData

struct ContentView1: View {
    
    @Query private var lists: [Mylist]
    
    @State private var search: String = ""
    @State private var isPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                
                MyListView(lists: lists)
                    
                Spacer()
                
                AddListButton(isPresented: $isPresented)
                    
                    .sheet(isPresented: $isPresented, content: {
                        NavigationStack {
                            AddNewListScreen()
                        }
                    })
                    
            }
            .navigationTitle("Reminders")
        }
        .searchable(text: $search)
    }
}

#Preview {
    ContentView1()
        .modelContainer(for: [Mylist.self])
}
