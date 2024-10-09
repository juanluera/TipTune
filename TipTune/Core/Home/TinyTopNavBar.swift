//
//  TinyTopNavBar.swift
//  TipTune
//
//  Created by Juan Antonio Luera on 9/28/24.
//

import SwiftUI

struct TinyTopNavBar: View {
    @State private var selectedFilter: String? = nil
    var onSearchTapped: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            // App Name
            Text("TipTune")
                .font(.headline)
                .padding(.top, 10)
                    
            // Filters and Search
            HStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        FilterButton(title: "Favorites", isSelected: selectedFilter == "Favorites") {
                                selectedFilter = "Favorites"
                        }
                        FilterButton(title: "Live Concerts", isSelected: selectedFilter == "Live Concerts") {
                                selectedFilter = "Live Concerts"
                        }
                        FilterButton(title: "Recommended", isSelected: selectedFilter == "Recommended") {
                            selectedFilter = "Recommended"
                        }
                    }
                }
            Spacer()
            Button(action: onSearchTapped) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.primary)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 10)
        }
        .background(Color(.systemBackground))
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

struct FilterButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.subheadline)
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .background(isSelected ? Color.blue : Color.clear)
                .foregroundColor(isSelected ? .white : .primary)
                .cornerRadius(15)
        }
    }
}

#Preview {
    TinyTopNavBar(onSearchTapped: {
        print("Search tapped")
    })
}
