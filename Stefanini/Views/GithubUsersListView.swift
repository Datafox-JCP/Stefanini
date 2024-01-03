    //
    //  GithubUsersListView.swift
    //  Stefanini
    //
    //  Created by Juan Hernandez Pazos on 03/01/24.
    //

import SwiftUI
import SwiftData

struct GithubUsersListView: View {
    // MARK: Properties
    
    @EnvironmentObject var usersViewModel: UsersListViewModel
    @Query var localDB: [User]
    
    // MARK: View
    var body: some View {
        NavigationStack {
            List(localDB, id: \.id) { user in
                VStack(alignment: .leading) {
                    Text(user.login?.capitalized ?? "")
                        .font(.headline)
                    
                    Label(user.url ?? "", systemImage: "globe")
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
            if localDB.isEmpty {
                await usersViewModel.getUsers()
            }
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
