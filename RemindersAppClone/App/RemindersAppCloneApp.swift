//
//  RemindersAppCloneApp.swift
//  RemindersAppClone
//
//  Created by Aleksandar Milidrag on 9/15/23.
//

import SwiftUI
import SwiftData

@main
struct RemindersAppCloneApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Mylist.self, Reminder.self], inMemory: false)
        }
    }
}
