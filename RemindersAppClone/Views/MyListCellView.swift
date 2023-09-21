//
//  MyListCellView.swift
//  RemindersAppClone
//
//  Created by Aleksandar Milidrag on 9/21/23.
//

import SwiftUI

struct MyListCellView: View {
    let list: Mylist
    
    var body: some View {
        HStack {
            Image(systemName: "line.3.horizontal.circle.fill")
                .foregroundStyle(Color(list.color))
            Text(list.name)
                .foregroundStyle(.black)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundStyle(.gray)
                .opacity(0.4)
                .padding([.trailing],10)
            
        }
        Divider()
    }
}

#Preview {
    MyListCellView(list: .init(name: "Preview", color: .blue))
}
