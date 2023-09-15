//
//  AddNewReminderScreen.swift
//  RemindersAppClone
//
//  Created by Aleksandar Milidrag on 9/15/23.
//

import SwiftUI

struct AddNewReminderScreen: View {
   
     var list: Mylist
//    @Environment (\.modelContext) private var modelContext
    @State private var openAddReminder: Bool = false
    @State private var title: String = ""
    
    private var isFormValid: Bool {
        !title.isEmpty
    }
    
    
    var body: some View {
        VStack {
            /// SHOWING REMINDERS
            List {
                ForEach(list.reminders) { reminder in
                    Text(reminder.title)
                }
            }
            HStack {
                Image(systemName: "plus.circle.fill")
                Button("New reminder") {
                   openAddReminder = true
                }
            }
            .foregroundStyle(.blue)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
           
        }
        .alert("New Reminder", isPresented: $openAddReminder) {
            TextField("", text: $title)
            Button("Cancel",role: .cancel) {
                
            }
            Button("Done") {
                
                if isFormValid {
                    withAnimation {
                        let newReminder = Reminder(title: title)
                          list.reminders.append(newReminder)
                        title.removeAll()
                    }
                }
            }
            
            
        }
    }
}

#Preview {
    AddNewReminderScreen(list: .init(name: "S"))
//        .modelContainer(for: [Mylist.self, Reminder.self], inMemory: true)

}
