    //
    //  GithubUsersListView.swift
    //  Stefanini
    //
    //  Created by Juan Hernandez Pazos on 03/01/24.
    //

import SwiftUI

struct GithubUsersListView: View {
    // MARK: Properties
    
    @ObservedObject var usersViewModel = UsersListViewModel()
    
    // MARK: View
    var body: some View {
        NavigationStack {
            List(usersViewModel.Users ?? [], id: \.id) { user in
                VStack(alignment: .leading) {
                    Text(user.login?.capitalized ?? "")
                        .font(.headline)
                    
                    Label(user.url ?? "", systemImage: "globe")
                        .font(.subheadline)
                    
                    Label(user.type.rawValue, systemImage: "person")
                        .font(.subheadline)
                } // VStack
            } // List
            .listStyle(.plain)
            .navigationTitle("Github Users")
            
            if usersViewModel.isLoading {
                LoaderView()
            }
        } // Navigation
        .task {
            await usersViewModel.getUsers()
        }
        .alert(isPresented: $usersViewModel.shouldShowAlert) {
            return Alert(
                title: Text("Error"),
                message: Text(usersViewModel.userError?.errorDescription ?? "")
            )
        } // Alert
    }
}

// MARK: - Preview
#Preview {
    GithubUsersListView()
}
