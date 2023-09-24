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
    @Query private var reminders: [Reminder]
    
    @State private var search: String = ""
    @Environment (\.isSearching) var isSearching
    @State private var isPresented: Bool = false
    
    private var reminderStatsBuilder = ReminderStatsBuilder()
    @State private var reminderStatsValues = ReminderStatsValues()
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                
                    HStack {
                        
                        NavigationLink {
                          Text("Show today reminders")
                        } label: {
                            ReminderStatsView(icon: "calendar", title: "Today", count: reminderStatsValues.todayCount)
                        }
                        
                        NavigationLink {
                          Text("Show all reminders")

                        } label: {
                            ReminderStatsView(icon: "tray.circle.fill", title: "All", count: reminderStatsValues.allCount, iconColor: .red)
                        }

                        
                        
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        
                        NavigationLink {
                        Text("Show scheduled reminders")
                        } label: {
                            ReminderStatsView(icon: "calendar.circle.fill", title: "Scheduled", count: reminderStatsValues.scheduledCount, iconColor: .secondary)
                        }

                        NavigationLink {
                        Text("Show completed reminders")
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
                
                Spacer()
                
                AddListButton(isPresented: $isPresented)
                
                    .sheet(isPresented: $isPresented, content: {
                        NavigationStack {
                            AddNewListScreen()
                        }
                    })
            }
            }
            .onAppear {
                reminderStatsValues = reminderStatsBuilder.build(reminders: reminders)
            }
            .navigationTitle("Reminders")
        }
        .searchable(text: $search, prompt: "Search reminders")
    }
}

#Preview {
    ContentView1()
        .modelContainer(for: [Mylist.self])
}
