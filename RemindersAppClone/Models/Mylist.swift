//
//  List.swift
//  RemindersAppClone
//
//  Created by Aleksandar Milidrag on 9/15/23.
//

import Foundation
import SwiftData
import UIKit

@Model
final class Mylist {
    
    var name: String
    @Attribute(.transformable(by: UIColorTransofrmer.self)) var color: UIColor  //complex type are expensive
    
    init(name: String, color: UIColor) {
        self.name = name
        self.color = color

    }
    
    @Relationship(deleteRule: .cascade)
    var reminders: [Reminder] = []
}


