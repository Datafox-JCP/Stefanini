//
//  UsersListViewModel.swift
//  Stefanini
//
//  Created by Juan Hernandez Pazos on 03/01/24.
//

import Foundation
import SwiftData

@MainActor
final class UsersListViewModel: ObservableObject {
    
    var modelContext: ModelContext?
    
    init(modelContext: ModelContext?) {
        self.modelContext = modelContext
    }
    
//    @Published var Users: [User]?
    @Published var userError: ErrorCases?
    @Published var shouldShowAlert = false
    @Published var isLoading = false
    
    func getUsers() async {
        isLoading = true
        do {
            let users = try await WebService.getUsersData()
            users.forEach {
                modelContext?.insert($0)
            }
            self.isLoading = false
        } catch(let error) {
            userError = ErrorCases.custom(error: error)
            shouldShowAlert = true
            isLoading = false
        }
    }
}
