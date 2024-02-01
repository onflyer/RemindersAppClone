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
    @Query  private var reminders: [Reminder]
    
    static var now: Date { Date.now }
    
    var searchedReminders: [Reminder] {
        return reminders.filter {
            $0.title.localizedStandardContains(search)
        }
    }
    var todayReminders: [Reminder] {
        return reminders.filter {
            $0.reminderDate!.isToday
        }
    }
    @Query(filter: #Predicate<Reminder> { $0.isCompleted == true
    }) private var completedReminders: [Reminder]
    
    @Query(filter: #Predicate<Reminder> { (($0.reminderDate != nil || $0.reminderTime != nil) && $0.isCompleted == false)
    }) private var scheduledReminders: [Reminder]
    
    @State var search: String = ""
    @State private var searching: Bool = false
    @State private var isPresented: Bool = false
    
    private var reminderStatsBuilder = ReminderStatsBuilder()
    @State private var reminderStatsValues = ReminderStatsValues()
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    HStack {
                        
                        NavigationLink {
                            ReminderListView(reminders: todayReminders)
                        } label: {
                            ReminderStatsView(icon: "calendar", title: "Today", count: reminderStatsValues.todayCount)
                        }
                        
                        NavigationLink {
                            ReminderListView(reminders: reminders)
                            
                        } label: {
                            ReminderStatsView(icon: "tray.circle.fill", title: "All", count: reminderStatsValues.allCount, iconColor: .red)
                        }
                        
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        
                        NavigationLink {
                            ReminderListView(reminders: scheduledReminders)
                        } label: {
                            ReminderStatsView(icon: "calendar.circle.fill", title: "Scheduled", count: reminderStatsValues.scheduledCount, iconColor: .secondary)
                        }
                        
                        NavigationLink {
                            ReminderListView(reminders: completedReminders)
                        } label: {
                            ReminderStatsView(icon: "checkmark.circle.fill", title: "Completed", count: reminderStatsValues.completedCount, iconColor: .primary)
                        }
                        
                        
                        
                    }
                    .padding(.horizontal)
                    
                    Text("My Lists")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    MyListView(lists: lists)
                    
                    AddListButton(isPresented: $isPresented)
                    
                    
                        .onChange(of: search, perform: { searchTerm in
                            searching = !searchTerm.isEmpty ? true : false
                        })
                    
                        .sheet(isPresented: $isPresented, content: {
                            NavigationStack {
                                AddNewListScreen()
                            }
                        })
                    
                }
            }
            .overlay(alignment: .center, content: {
                if searching {
                    ReminderListView(reminders: searchedReminders)
                        
                }
               
            })
            .onAppear {
                reminderStatsValues = reminderStatsBuilder.build(reminders: reminders)
            }
            .navigationTitle("Reminders")
            .searchable(text: $search, prompt: "Search reminders")
        }
        
    }
}

//#Preview {
//    ContentView1()
//        .modelContainer(for: [Mylist.self])
//}
