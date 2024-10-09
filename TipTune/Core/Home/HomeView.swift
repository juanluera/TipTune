//
//  HomeView.swift
//  TipTune
//
//  Created by Juan Angel Luera on 9/5/24.
//

// TODO
// ADD library
//Feed and Favorites
// Circle Library
// Subscriptions
// Need more ideas

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing:0){
            // Top Navigation Bar
            TinyTopNavBar(onSearchTapped: {
                print("Search tapped")
            })
            
            ScrollView{
                VStack(alignment: .leading, spacing:10) {
                    
                    Text("Favorite Artists")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    SquareButtonView(buttons: [
                        CarouselButton(title: "Home", iconName: "house", color: .blue) {},
                        CarouselButton(title: "Search", iconName: "magnifyingglass", color: .green) {},
                        CarouselButton(title: "Profile", iconName: "person", color: .red) {},
                        CarouselButton(title: "Settings", iconName: "gear", color: .purple) {},
                        CarouselButton(title: "Settings", iconName: "gear", color: .purple) {},
                        CarouselButton(title: "Settings", iconName: "gear", color: .purple) {},
                        CarouselButton(title: "Settings", iconName: "gear", color: .purple) {}
                    ])
                    
                    Text("Recommended")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    SquareButtonView(buttons: [
                        CarouselButton(title: "yoo", iconName: "house", color: .blue) {},
                        CarouselButton(title: "Search", iconName: "magnifyingglass", color: .green) {},
                        CarouselButton(title: "Profile", iconName: "person", color: .red) {},
                        CarouselButton(title: "Settings", iconName: "gear", color: .purple) {},
                        CarouselButton(title: "Settings", iconName: "gear", color: .purple) {},
                        CarouselButton(title: "Settings", iconName: "gear", color: .purple) {},
                        CarouselButton(title: "Settings", iconName: "gear", color: .purple) {}
                    ])
                }
            }
            
            MainNavBar(
                onHomeTapped: { print("Home tapped") },
                onBrowseTapped: { print("Browse tapped") },
                onNotificationsTapped: { print("Notifications tapped") },
                onProfileTapped: { print("Profile tapped") }
            )

        }
    }
}

#Preview {
    HomeView()
}
