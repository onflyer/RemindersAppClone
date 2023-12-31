//
//  Reminder.swift
//  RemindersAppClone
//
//  Created by Aleksandar Milidrag on 9/15/23.
//

import Foundation
import SwiftData

@Model
final class Reminder {
    
    var title: String
    var notes: String?
    var isCompleted: Bool  // do default value
    var hasDate: Bool = false
    var hasTime: Bool = false
    var reminderDate: Date?
    var reminderTime: Date?
    var list: Mylist? // to one always optional
    
    init(title: String, notes: String? = nil, isCompleted: Bool = false, reminderDate: Date? = nil, reminderTime: Date? = nil) {
        self.title = title
        self.notes = notes
        self.isCompleted = isCompleted
        self.reminderDate = reminderDate ?? Date()
        self.reminderTime = reminderTime ?? Date()
        self.hasDate = reminderDate != nil
        self.hasTime = reminderTime != nil
    }
    
    
}
