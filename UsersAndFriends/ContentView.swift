//
//  ContentView.swift
//  UsersAndFriends
//
//  Created by Василий Буланов on 11/12/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var users = UserProcess()
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                ForEach(users.users, id: \.id) { user in
                    
                    NavigationLink(destination: UserView(user: user, users: users)) {
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.headline)
                            Text(String(user.age))
                        }
                        
                    }
                    
                }
                
            }
            .navigationTitle("UsersAndFriends")
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
