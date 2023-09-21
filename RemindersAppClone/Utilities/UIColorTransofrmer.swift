//
//  UIColorTransofrmer.swift
//  RemindersAppClone
//
//  Created by Aleksandar Milidrag on 9/21/23.
//

import Foundation
import UIKit

class UIColorTransofrmer: ValueTransformer {
    
    //return data
    override func transformedValue(_ value: Any?) -> Any? {
        guard let color = value as? UIColor else { return nil }
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: true)
            return data
        } catch {
            return nil
        }
    }
    //return UIColor
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else { return nil }
        
        do {
            let color = try NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data)
            return color
        } catch {
            return nil
        }

    }
}
