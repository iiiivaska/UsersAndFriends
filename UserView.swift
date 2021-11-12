//
//  UserView.swift
//  UsersAndFriends
//
//  Created by Василий Буланов on 11/12/21.
//

import SwiftUI

struct UserView: View {
    var user: User
    @ObservedObject var users: UserProcess
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Text(user.name)
                    Image(systemName: user.isActive ? "bolt.fill" : "bolt")
                        .foregroundColor(user.isActive ? .yellow : nil)
                }
                Text("Age: \(user.age)")
            }
            
            Section {
                Text("Address: " + user.address)
                Text(user.about)
            }
            
            Section {
                List (user.friends, id: \.id) { friend in
                    //ForEach(user.friends, id: \.id) { friend in
                        NavigationLink (destination: UserView(user: users.users.first(where: {friend.id == $0.id}) ?? User(), users: users)) {
                            Text(friend.name)
                        }
                    //}
                }
            }
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(user: User(), users: UserProcess())
    }
}
