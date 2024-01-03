//
//  UsersListViewModel.swift
//  Stefanini
//
//  Created by Juan Hernandez Pazos on 03/01/24.
//

import Foundation

@MainActor
final class UsersListViewModel: ObservableObject {
    @Published var Users: [User]?
    @Published var userError: ErrorCases?
    @Published var shouldShowAlert = false
    @Published var isLoading = false
    
    func getUsers() async {
        isLoading = true
        do {
            self.Users = try await WebService.getUsersData()
            self.isLoading = false
        } catch(let error) {
            userError = ErrorCases.custom(error: error)
            shouldShowAlert = true
            isLoading = false
        }
    }
}
