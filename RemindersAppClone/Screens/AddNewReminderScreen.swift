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
    @State private var selectedReminder: Reminder?
    @State private var showReminderDetailScreen: Bool = false
    
    
    private func isReminderSelected(_ reminder: Reminder) -> Bool {
        selectedReminder?.id == reminder.id
    }
    
    private var isFormValid: Bool {
        !title.isEmpty
    }
    
    
    var body: some View {
        VStack {
            /// SHOWING REMINDERS
            List {
                ForEach(list.reminders) { reminder in
                    ReminderCellView(reminder: reminder, isSelected: isReminderSelected(reminder)) { event in
                        switch event {
                        case .onInfo:
                            showReminderDetailScreen = true
                        case .onCheckedChanged(let reminder, let isCompleted):
                            print("ON CHECKED CHANGE")
                        case .onSelect(let reminder):
                            selectedReminder = reminder
                        }
                    }
                }
                .onDelete(perform: { indexSet in
                    indexSet.forEach { index in
                        let reminder = list.reminders[index]
                        withAnimation {
                            reminder.modelContext?.delete(reminder)
                        }
                    }
                })
                
            }
            
            .sheet(isPresented: $showReminderDetailScreen, content: {
                ReminderDetailScreen(reminder: selectedReminder!)
            })
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
