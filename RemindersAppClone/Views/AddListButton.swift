//
//  AddListButton.swift
//  RemindersAppClone
//
//  Created by Aleksandar Milidrag on 9/20/23.
//

import SwiftUI

struct AddListButton: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        Button(action: {
          isPresented = true
        }, label: {
            Text(verbatim: "Add List")
                .frame(maxWidth: .infinity, alignment: .trailing)
                .font(.headline)
        })
        .padding()
        
    }
}

#Preview {
    AddListButton(isPresented: .constant(true))
        .previewLayout(.sizeThatFits)
}
