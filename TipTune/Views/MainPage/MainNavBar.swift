//
//  MainNavBar.swift
//  TipTune
//
//  Created by Juan Antonio Luera on 9/29/24.
//

import SwiftUI

struct MainNavBar: View {
    @Binding var selectedTab: Tab
 
    enum Tab {
        case home, search, notifications, settings
    }
    
    var body: some View {
        HStack(spacing: 30) {
            NavBarButton(tab: .home, selectedTab: $selectedTab, selectedIcon: "house.fill", unselectedIcon: "house", label:"Home")
            NavBarButton(tab: .search, selectedTab: $selectedTab, selectedIcon: "magnifyingglass.circle.fill", unselectedIcon: "magnifyingglass", label:"Search")
            NavBarButton(tab: .notifications, selectedTab: $selectedTab, selectedIcon: "bell.fill", unselectedIcon: "bell", label:"Notifications")
            NavBarButton(tab: .settings, selectedTab: $selectedTab, selectedIcon: "gearshape.fil", unselectedIcon:"gearshape", label:"Settings")
        }
        .padding()
        .background(Color.black)
        .shadow(radius: 2)
    }
}

struct NavBarButton: View {
    var tab: MainNavBar.Tab
    @Binding var selectedTab: MainNavBar.Tab
    var selectedIcon: String
    var unselectedIcon: String

    var label: String
    
    var body: some View{
        Button(action:{
            selectedTab = tab
            handleTap()
        }){
            VStack(spacing: 5){
                Image(systemName: selectedTab == tab ? selectedIcon: unselectedIcon)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(selectedTab == tab ? .blue : .gray)
                
                Text(label)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 10)
            .cornerRadius(10)
        }
    }
    
    private func handleTap() {
        switch tab {
        case .home:
            print("Navigating to Home")
        case .search:
            print("Navigating to Search")
        case .notifications:
            print("Navigating to Library")
        case .settings:
            print("Navigating to Settings")
        }
    }
}

#Preview {
    //MainNavBar()
    @State var selectedTab: MainNavBar.Tab = .home
    return MainNavBar(selectedTab: $selectedTab)
}


