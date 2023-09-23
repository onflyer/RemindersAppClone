//
//  RemindersAppCloneApp.swift
//  RemindersAppClone
//
//  Created by Aleksandar Milidrag on 9/15/23.
//

import SwiftUI
import SwiftData
import UserNotifications

@main
struct RemindersAppCloneApp: App {
    init() {
        ValueTransformer.setValueTransformer(UIColorTransofrmer(), forName: NSValueTransformerName("UIColorTransofrmer"))
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                
            } else {
                
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView1()
                .modelContainer(for: [Mylist.self, Reminder.self], inMemory: false)
        }
    }
}
