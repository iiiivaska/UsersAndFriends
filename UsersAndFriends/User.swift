//
//  User.swift
//  UsersAndFriends
//
//  Created by Василий Буланов on 11/12/21.
//

import Foundation

//struct Response: Codable {
//    enum CodingKeys: String, CodingKey {
//        case results = ""
//    }
//
//    var results: [User]
//}

struct User: Codable {
    struct Friend: Codable {
        var id: String = "test"
        var name: String = "test"
    }
    
    var id: String = "test"
    var isActive: Bool = false
    var name: String = "test"
    var age: Int = 0
    var company: String = "test"
    var email: String = "test@test.com"
    var address: String = "test/test"
    var about: String = "test"
    var registered: String = "test"
    var tags: [String] = ["test", "test"]
    var friends: [Friend] = [Friend(), Friend()]
}

class UserProcess: ObservableObject {
    @Published var users: [User] = []
    let url = "https://www.hackingwithswift.com/samples/friendface.json"
    
    func loadUsers() {
        guard let url = URL(string: self.url) else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
                    
                    DispatchQueue.main.async {
                        self.users.append(contentsOf: decodedResponse)
                    }
                    
                    return
                }
            }
            
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
    
    init() {
        print("Starting load Data")
        loadUsers()
        print("Finish load Data")
    }
}
