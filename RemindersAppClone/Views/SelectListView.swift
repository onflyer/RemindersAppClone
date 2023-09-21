//
//  SelectListView.swift
//  RemindersAppClone
//
//  Created by Aleksandar Milidrag on 9/19/23.
//

import SwiftUI
import SwiftData

struct SelectListView: View {
    @Query private var lists: [Mylist]
    @Binding var selectedList: Mylist?
        
    var body: some View {
        List (lists) { list in
            HStack {
                Image(systemName: "line.3.horizontal.circle.fill")
                    .foregroundStyle(.blue)
                Text(list.name)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .contentShape(Rectangle())
            .onTapGesture {
                self.selectedList = list
            }
            
            Spacer()
            
            if selectedList == list {
                Image(systemName: "checkmark")
            }
            
        }
    }
}

#Preview {
    SelectListView(selectedList: .constant(.init(name: "Ss", color: .black)))
}
