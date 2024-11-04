//
//  TopNavBar.swift
//  TipTune
//
//  Created by Juan Antonio Luera on 9/28/24.
//

import SwiftUI

import SwiftUI

// TODO need to figure out how to pass picture/logo here 

struct CustomNavBar: View {
    var logo: Image
    var onReturnTapped: () -> Void
    var onArtistPageTapped: () -> Void
    var onEventsTapped: () -> Void
    var onAnnouncementsTapped: () -> Void
    var onShopTapped: () -> Void
    
    var body: some View {
        
        VStack (spacing: 20 ){
            HStack {
                Button(action: onReturnTapped) {
                    Image(systemName: "arrow.left")
                }
                Spacer()
                // Logo in the middle
                logo
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40) // Adjust size to fit the nav bar
                    .clipShape(Circle()) // Making the logo circular for now
                
                Spacer()
                
                // Empty space to balance the left arrow
                Button(action: {}) {
                    Image(systemName: "") // Empty button for layout balancing
                }.hidden() // Hide the button for spacing
            }
        
            
            HStack(spacing: 20) {
                Button(action: onArtistPageTapped) {
                    VStack {
                        Image(systemName: "person")
                        Text("Artist")
                            .font(.caption)
                    }
                }
                
                Button(action: onEventsTapped) {
                    VStack {
                        Image(systemName: "calendar")
                        Text("Events")
                            .font(.caption)
                    }
                }
                
                Button(action: onAnnouncementsTapped) {
                    VStack {
                        Image(systemName: "megaphone")
                        Text("News")
                            .font(.caption)
                    }
                }
                
                Button(action: onShopTapped) {
                    VStack {
                        Image(systemName: "bag")
                        Text("Shop")
                            .font(.caption)
                    }
                }
            }
       

        }
        .padding()
        .background(Color.white)
    .shadow(radius: 2)
    }
}


#Preview {
    CustomNavBar(
        logo: Image(systemName: "photo"),
        onReturnTapped: { print("Return tapped") },
        onArtistPageTapped: { print("Artist Page tapped") },
        onEventsTapped: { print("Events tapped") },
        onAnnouncementsTapped: { print("Announcements tapped") },
        onShopTapped: { print("Shop tapped") }
    )
}



