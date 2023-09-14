//
//  List.swift
//  RemindersAppClone
//
//  Created by Aleksandar Milidrag on 9/15/23.
//

import Foundation
import SwiftData

@Model
final class Mylist {
    
    var name: String
    
    init(name: String) {
        self.name = name
//    
    }
    
    @Relationship(deleteRule: .cascade)
    var reminders: [Reminder] = []
}
