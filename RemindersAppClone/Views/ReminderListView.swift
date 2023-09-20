//
//  ReminderListView.swift
//  RemindersAppClone
//
//  Created by Aleksandar Milidrag on 9/20/23.
//

import SwiftUI
import SwiftData

struct ReminderListView: View {
    let reminders1: Reminder
    @Query private var reminders: [Reminder]
    @State private var selectedReminder: Reminder?
    @State private var showReminderDetailScreen: Bool = false
    
    private func isReminderSelected(_ reminder: Reminder) -> Bool {
        selectedReminder?.id == reminder.id
    }
    var body: some View {
        VStack{
            List {
                ForEach(reminders) { reminder in
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
                        let reminder = reminders[index]
                        withAnimation {
                            reminder.modelContext?.delete(reminder)
                        }
                    }
                })
                
            }
            
            .sheet(isPresented: $showReminderDetailScreen, content: {
                ReminderDetailScreen(reminder: selectedReminder!)
            })
        }
    }
}

#Preview {
    ReminderListView(reminders1: .init(title: "S"))
}
