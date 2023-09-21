//
//  MyListView.swift
//  RemindersAppClone
//
//  Created by Aleksandar Milidrag on 9/21/23.
//

import SwiftUI
import SwiftData

struct MyListView: View {
    
    let lists: [Mylist]
    
    var body: some View {
        
            ForEach(lists) { list in
                NavigationLink(value: list, label: {
                    VStack {
                        MyListCellView(list: list)
                        
                }
            })
        }
            .navigationDestination(for: Mylist.self, destination: { list in
                AddNewReminderScreen(list: list)
            })
        .padding()
    }
}

#Preview {
    MyListView(lists: [])
        .modelContainer(for: [Mylist.self, Reminder.self], inMemory: true)
}
