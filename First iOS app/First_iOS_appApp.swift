//
//  First_iOS_appApp.swift
//  First iOS app
//
//  Created by Kaur, Gurinder on 24/01/22.
//

import SwiftUI

@main
struct First_iOS_appApp: App {
    @StateObject private var tasks =  NightWatchTasks()
    var body: some Scene {
        WindowGroup {
            ContentView(nightTasks: tasks)
        }
    }
}
