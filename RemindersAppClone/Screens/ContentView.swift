//
//  ContentView.swift
//  RemindersAppClone
//
//  Created by Aleksandar Milidrag on 9/15/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment (\.modelContext) private var context
    
    var body: some View {
        NavigationStack {
            VStack {
                
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [Mylist.self, Reminder.self], inMemory: true)

}
