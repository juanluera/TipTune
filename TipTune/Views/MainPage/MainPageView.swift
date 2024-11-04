//
//  MainPageView.swift
//  TipTune
//
//  Created by Juan Antonio Luera on 11/3/24.
//

import SwiftUI

struct MainPageView: View {
    @State private var selectedTab: MainNavBar.Tab = .home
    
    var body: some View {
        NavigationView {
            VStack{
                // Displaying views based on selected tab
                switch selectedTab {
                case .home:
                    HomeView()
                case .search:
                    SearchView()
                case .notifications:
                    NotificationView()
                case .settings:
                    SettingView()
                }
                Spacer()
                MainNavBar(selectedTab: $selectedTab)
            }
        }
    }
}

#Preview {
    MainPageView()
}
