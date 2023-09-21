//
//  ReminderDetailScreen.swift
//  RemindersAppClone
//
//  Created by Aleksandar Milidrag on 9/19/23.
//

import SwiftUI

struct ReminderDetailScreen: View {
    @Bindable var reminder: Reminder
    @Environment (\.dismiss) private var dismiss
    
    private var isFormValid: Bool {
        !reminder.title.isEmpty
    }
        
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section {
                        TextField("Title", text: $reminder.title)
                        TextField("Notes", text: $reminder.notes ?? "")
                    }
                    Section {
                        Toggle(isOn: $reminder.hasDate, label: {
                           Image(systemName: "calendar")
                                .foregroundStyle(.red)
                        })
                        if reminder.hasDate {
                            DatePicker("Select Date", selection: $reminder.reminderDate ?? Date(), displayedComponents: .date)
                        }
                        Toggle(isOn: $reminder.hasTime, label: {
                           Image(systemName: "clock")
                                .foregroundStyle(.blue)
                        })
                        if reminder.hasTime {
                            DatePicker("Select Date", selection: $reminder.reminderTime ?? Date(), displayedComponents: .hourAndMinute)
                        }
                        
                        Section {
                            NavigationLink {
                                SelectListView(selectedList: $reminder.list)
                            } label: {
                                HStack {
                                  Text("List")
                                    Spacer()
                                    Text(reminder.list!.name)
                                }
                            }

                        }
                    }
                }
                .onChange(of: reminder.hasDate, perform: { hasDate in
                    if hasDate {
                        reminder.reminderDate = Date()
                    }
                })
                .onChange(of: reminder.hasTime, perform: { hasTime in
                    if hasTime {
                        reminder.reminderTime = Date()
                    }
                })
                .listStyle(.insetGrouped)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Details")
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        if isFormValid {
                            do {
                                try reminder.modelContext?.save()
                            } catch {
                                print(error)
                            }
                           
                        }
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    ReminderDetailScreen(reminder: .init(title: "preview"))
}
