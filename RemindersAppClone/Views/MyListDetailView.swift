//
//  MyListDetailView.swift
//  RemindersAppClone
//
//  Created by Aleksandar Milidrag on 9/24/23.
//

import SwiftUI
import SwiftData

struct MyListDetailView: View {
    
    let myList: Mylist
    @State private var openAddReminder: Bool = false
    @State private var title: String = ""
    
    @Query private var reminderResults: [Reminder]
    
    private var isFormValid: Bool {
        !title.isEmpty
    }
    
   
    
    var body: some View {
        VStack {
                
            // Display List of Reminders
            ReminderListView(reminders: reminderResults)
            
            HStack {
                Image(systemName: "plus.circle.fill")
                Button("New Reminder") {
                    openAddReminder = true
                }
            }.foregroundColor(.blue)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
        }.alert("New Reminder", isPresented: $openAddReminder) {
            TextField("", text: $title)
            Button("Cancel", role: .cancel) { }
            Button("Done") {
                if isFormValid {
                    withAnimation {
                        let newReminder = Reminder(title: title)
                          myList.reminders.append(newReminder)
                        title.removeAll()
                    }
                }
            }
        }
    }
}

//#Preview {
//    MyListDetailView()
//}
