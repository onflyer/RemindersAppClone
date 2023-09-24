//
//  ReminderCellView.swift
//  RemindersAppClone
//
//  Created by Aleksandar Milidrag on 9/19/23.
//

import SwiftUI
import SwiftData

enum ReminderCellEvents {
    case onInfo
    case onCheckedChanged(Reminder, Bool)
    case onSelect(Reminder)
}

struct ReminderCellView: View {
    
    var reminder: Reminder
    let delay = DelayTask()
    let isSelected: Bool
    
    @State private var checked: Bool = false
    
    let onEvent: (ReminderCellEvents) -> Void
    
    private func formatDate(_ date: Date) -> String {
        if date.isToday {
            return "Today"
        } else if date.isTomorrow {
            return "Tomorrow"
        } else {
            return date.formatted(date: .numeric, time: .omitted)
        }
    }
    
    var body: some View {
        HStack {
            Image(systemName: checked ? "circle.inset.filled" : "circle")
                .font(.title2)
                .opacity(0.4)
                .onTapGesture {
                    checked.toggle()
                    
                    delay.delayTask?.cancel()
                    
                    delay.delayTask = Task {
                        try? await Task.sleep(nanoseconds: 2_000_000_000)
                        onEvent(.onCheckedChanged(reminder, checked))

                    }
                    
                }
            VStack(alignment: .leading) {
                Text(reminder.title)
                if let notes = reminder.notes, !notes.isEmpty {
                    Text(notes)
                        .opacity(0.4)
                        .font(.caption)
                }
                HStack {
                    if let reminderDate = reminder.reminderDate {
                        Text(formatDate(reminderDate))
                    }
                    
                    if let reminderTime = reminder.reminderTime {
                        Text(reminderTime.formatted(date: .omitted, time: .shortened))
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
                .font(.caption)
                .opacity(0.4)

            }
            Spacer()
            Image(systemName: "info.circle.fill")
                .opacity(isSelected ? 1.0 : 0.0)
                .onTapGesture {
                    onEvent(.onInfo)
                }
        }
        .onAppear {
            checked = reminder.isCompleted
        }
        .contentShape(Rectangle())
        .onTapGesture {
            onEvent(.onSelect(reminder))
        }
    }
}

#Preview {
    ReminderCellView(reminder: .init(title: "Preview"), isSelected: false, onEvent: { _ in
        
    })
}
