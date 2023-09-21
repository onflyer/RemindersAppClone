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
    init() {
        ValueTransformer.setValueTransformer(UIColorTransofrmer(), forName: NSValueTransformerName("UIColorTransofrmer"))
    }
    var body: some Scene {
        WindowGroup {
            ContentView1()
                .modelContainer(for: [Mylist.self, Reminder.self], inMemory: false)
        }
    }
}
