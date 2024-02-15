//
//  MovieAppApp.swift
//  MovieApp
//
//  Created by Thiago on 15/02/24.
//

import SwiftUI

@main
struct MovieApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeScreen()
        }
    }
}
