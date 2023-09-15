//
//  ContentView.swift
//  RemindersAppClone
//
//  Created by Aleksandar Milidrag on 9/15/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State var isPresented: Bool = false
    @Environment (\.modelContext) private var context
    @Query private var lists: [Mylist]
    
    var body: some View {
        NavigationStack {
            VStack {
                if lists.isEmpty {
                    ContentUnavailableView(
                      "No Reminders",
                      systemImage: "square.stack.3d.up.slash",
                      description: Text("Tap add to create your first reminder."))
                } else {
                    ForEach(lists) { list in
                        NavigationLink(value: list) {
                            VStack {
                                HStack {
                                    Image(systemName: "line.3.horizontal.circle.fill")
                                        .foregroundStyle(.black)
                                    Text(list.name)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundStyle(.gray)
                                        .opacity(0.4)
                                        .padding([.trailing],10)
                                    
                                }
                                Divider()
                            }
                        }

                    }
                    .scrollContentBackground(.hidden)
                        .navigationDestination(for: Mylist.self) { list in
                            Text(list.name)
                               
                        }
                }
                Spacer()
                Button(action: {
                  isPresented = true
                }, label: {
                    Text(verbatim: "Add List")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .font(.headline)
                })
                .padding()
            }
            .sheet(isPresented: $isPresented, content: {
                NavigationStack {
                    AddNewListScreen()

                }
            })
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [Mylist.self, Reminder.self], inMemory: true)

}
