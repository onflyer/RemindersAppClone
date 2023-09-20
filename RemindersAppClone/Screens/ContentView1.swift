//
//  ContentView1.swift
//  RemindersAppClone
//
//  Created by Aleksandar Milidrag on 9/20/23.
//

import SwiftUI

struct ContentView1: View {
    @State private var search: String = ""
    @State private var isPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
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
}
