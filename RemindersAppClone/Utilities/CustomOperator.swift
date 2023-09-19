//
//  CustomOperator.swift
//  RemindersAppClone
//
//  Created by Aleksandar Milidrag on 9/19/23.
//

import Foundation
import SwiftUI

public func ??<T>(lhs: Binding<Optional<T>>, rhs: T) -> Binding<T> {
    Binding(
        get: { lhs.wrappedValue ?? rhs },
        set: { lhs.wrappedValue = $0 }
    )
}
