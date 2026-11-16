//
//  HomeworkStatTrackerApp.swift
//  HomeworkStatTracker
//
//  Created by ALVIN WEI on 10/26/26.
//

import SwiftUI
import SwiftData

@main
struct HomeworkStatTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Subject.self])
        }
    }
}
