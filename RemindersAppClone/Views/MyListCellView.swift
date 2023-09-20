//
//  MyListCellView.swift
//  RemindersAppClone
//
//  Created by Aleksandar Milidrag on 9/20/23.
//

import SwiftUI
import SwiftData

struct MyListCellView: View {
    
    let myList: Mylist
    
    var body: some View {
        HStack {
            Image(systemName: "line.3.horizontal.circle.fill")
                .foregroundStyle(.black)
            Text(myList.name)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
                .opacity(0.4)
                .padding([.trailing], 10)
        }
    }
}

#Preview {
    MyListCellView(myList: .init(name: "Preview") )
        .modelContainer(for: [Mylist.self, Reminder.self], inMemory: true)
}
