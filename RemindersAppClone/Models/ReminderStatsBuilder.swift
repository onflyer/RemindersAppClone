//
//  ReminderStatsBuilder.swift
//  RemindersAppClone
//
//  Created by Aleksandar Milidrag on 9/23/23.
//

import Foundation
import SwiftData
import SwiftUI

enum ReminderStatType {
    case today
    case all
    case scheduled
    case completed
}

struct ReminderStatsValues {
    var todayCount: Int = 0
    var scheduledCount: Int = 0
    var allCount: Int = 0
    var completedCount: Int = 0
}

struct ReminderStatsBuilder {
    
    func build(reminders: [Reminder]) -> ReminderStatsValues {
        
        
        let todaysCount = calculateTodaysCount(reminders: reminders)
        let scheduledCount = calculateScheduledCount(reminders: reminders)
        let completedCount = calculateCompletedCount(reminders: reminders)
        let allCount = calculateAllCount(reminders: reminders)
        
        return ReminderStatsValues(todayCount: todaysCount, scheduledCount: scheduledCount, allCount: allCount, completedCount: completedCount)
    }
    
    private func calculateScheduledCount(reminders: [Reminder]) -> Int {
        return reminders.reduce(0) { result, reminder in
            return ((reminder.reminderDate != nil || reminder.reminderTime != nil) && !reminder.isCompleted)  ? result + 1: result
        }
    }
    
    private func calculateTodaysCount(reminders: [Reminder]) -> Int {
        return reminders.reduce(0) { result, reminder in
            let isToday = reminder.reminderDate?.isToday ?? false
            return isToday ? result + 1: result
        }
    }
    
    private func calculateCompletedCount(reminders: [Reminder]) -> Int {
        return reminders.reduce(0) { result, reminder in
            return reminder.isCompleted ? result + 1 : result
        }
    }
    
    private func calculateAllCount(reminders: [Reminder]) -> Int {
        return reminders.reduce(0) { result, reminder in
            return !reminder.isCompleted ? result + 1 : result
        }
    }
    
}

