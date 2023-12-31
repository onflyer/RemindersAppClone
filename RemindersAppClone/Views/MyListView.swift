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
    
    @Environment (\.colorScheme) private var colorScheme
    
    var body: some View {
        
            ForEach(lists) { list in
                NavigationLink(value: list, label: {
                    VStack {
                        MyListCellView(list: list)
                            .foregroundStyle(colorScheme == .dark ? Color.offWhite: Color.darkGray)
                        
                }
                    
            })
                .listRowBackground(listRowBackground(colorScheme == .dark ? Color.darkGray : Color.offWhite))
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
