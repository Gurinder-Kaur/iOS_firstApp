//
//  NightWatchTasks.swift
//  First iOS app
//
//  Created by Kaur, Gurinder on 31/01/22.
//

import Foundation

class NightWatchTasks: ObservableObject{
    @Published var  daily = [
        Task(name: "Check all Windows", isComplete: false, lastCompleted: nil),
        Task(name: "Check that safe is locked", isComplete: false, lastCompleted: nil),
        Task(name: "Check the mailbox", isComplete: false, lastCompleted: nil),
        Task(name: "Inspect security cameras", isComplete: false, lastCompleted: nil),
        Task(name: "Document strange/unusual occurences", isComplete: false, lastCompleted: nil)
        ]
    @Published var weekly = [
        Task(name: "Check inside all vacant rooms", isComplete: false, lastCompleted: nil),
        Task(name: "Walk the perimeter of property", isComplete: false, lastCompleted: nil)
        ]
    @Published var monthly = [
        Task(name: "Test security alarms", isComplete: false, lastCompleted: nil),
        Task(name: "Test motion detectors", isComplete: false, lastCompleted: nil),
        Task(name: "Test smoke alarms", isComplete: false, lastCompleted: nil)
        ]
}
