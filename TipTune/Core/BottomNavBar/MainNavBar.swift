//
//  MainNavBar.swift
//  TipTune
//
//  Created by Juan Antonio Luera on 9/29/24.
//

import SwiftUI

struct MainNavBar: View {
    var onHomeTapped: () -> Void
    var onBrowseTapped: () -> Void
    var onNotificationsTapped: () -> Void
    var onProfileTapped: () -> Void
 
    var body: some View {
        HStack {
            
            Button(action: onHomeTapped){
                VStack{
                    Image(systemName: "home")
                    Text("Home")
                        .font(.caption)
                }
            }
            
            Spacer()
            
            Button(action: onBrowseTapped){
                VStack{
                    Image(systemName: "browse")
                    Text("Browse")
                        .font(.caption)
                }
            }
            
            Spacer()
            
            Button(action: onNotificationsTapped){
                VStack{
                    Image(systemName: "notifications")
                    Text("Notifications")
                        .font(.caption)
                }
            }
            
            Spacer()
            
            Button(action: onProfileTapped){
                VStack{
                    Image(systemName: "profile")
                    Text("Profile")
                        .font(.caption)
                }
            }
        }
        .padding()
        .background(Color.white)
        .shadow(radius: 2)
    }
}

#Preview {
    MainNavBar(
        onHomeTapped: { print("Home tapped") },
        onBrowseTapped: { print("Browse tapped") },
        onNotificationsTapped: { print("Notifications tapped") },
        onProfileTapped: { print("Profile tapped") }
    )
}


