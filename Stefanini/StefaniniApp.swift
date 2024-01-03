//
//  StefaniniApp.swift
//  Stefanini
//
//  Created by Juan Hernandez Pazos on 03/01/24.
//

import SwiftUI
import SwiftData

@main
struct StefaniniApp: App {
    let container: ModelContainer
    
    var body: some Scene {
        WindowGroup {
            GithubUsersListView()
                .environmentObject(UsersListViewModel(modelContext: container.mainContext))
                .modelContainer(container)
        }
    }
    
    init() {
        do {
            container = try ModelContainer(for: User.self)
        } catch {
            fatalError("Failed to create ModelContainer")
        }
    }
}
