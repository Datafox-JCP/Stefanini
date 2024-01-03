//
//  WebService.swift
//  Stefanini
//
//  Created by Juan Hernandez Pazos on 03/01/24.
//

import Foundation

final class WebService {
    static func getUsersData() async throws -> [User] {
        let urlString = "https://api.github.com/users"
        guard let url = URL(string: urlString) else {
            throw ErrorCases.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, (200..<300) ~= response.statusCode else {
            throw ErrorCases.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([User].self, from: data)
        } catch {
            throw ErrorCases.invalidData
        }
    }
}
