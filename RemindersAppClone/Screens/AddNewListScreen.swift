//
//  AddNewListScreen.swift
//  RemindersAppClone
//
//  Created by Aleksandar Milidrag on 9/15/23.
//

import SwiftUI

struct AddNewListScreen: View {
    @State private var name: String = ""
    @Environment (\.dismiss) private var dismiss
    @Environment (\.modelContext) private var modelContext
    @State private var selectedColor: Color = .yellow
    
    private var isFormValid: Bool {
        !name.isEmpty
    }
    
//    let onSave: (String) -> Void
    
    var body: some View {
        VStack {
            
            VStack {
                Image(systemName: "line.3.horizontal.circle.fill")
                    .foregroundColor(selectedColor)
                    .font(.system(size: 100))
                TextField("List Name", text: $name)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)
            }
            .padding(30)
            .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            
            ColorPickerView(selectedColor: $selectedColor)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("New List")
                    .font(.headline)
            }
            ToolbarItem(placement: .topBarLeading) {
                Button("Close") {
                    dismiss()
                }
                    
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Done") {
                    withAnimation {
                        let newItem = Mylist(name: name, color: UIColor(selectedColor))
                        modelContext.insert(newItem)
                    }
                    dismiss()
                }.disabled(!isFormValid)
                    
            }
            
        }
    }
}

#Preview {
    NavigationStack {
        AddNewListScreen()
            .modelContainer(for: [Mylist.self, Reminder.self], inMemory: true)
    }
    
}
