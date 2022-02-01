//
//  Task.swift
//  First iOS app
//
//  Created by Kaur, Gurinder on 30/01/22.
//

import Foundation

struct Task : Identifiable{
    let id = UUID()
    let name: String
    var isComplete: Bool
    var lastCompleted: Date?
}
