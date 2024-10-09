//
//  SquareButtonView.swift
//  TipTune
//
//  Created by Juan Antonio Luera on 9/28/24.
//

import SwiftUI

struct SquareButtonView: View {
    let buttons: [CarouselButton]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 10){
                ForEach(buttons){ button in
                    Button(action: button.action){
                        VStack{
                            Image(systemName: button.iconName)
                                .font(.system(size:30))
                            Text(button.title)
                                .font(.caption)
                        }
                        .frame(width: 80, height: 80)
                        .background(button.color)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                }
            }
            .padding()
        }
    }
}


#Preview {
    SquareButtonView(buttons: [
        CarouselButton(title: "Home", iconName: "house", color: .blue) {},
        CarouselButton(title: "Search", iconName: "magnifyingglass", color: .green) {},
        CarouselButton(title: "Profile", iconName: "person", color: .red) {},
        CarouselButton(title: "Settings", iconName: "gear", color: .purple) {},
        CarouselButton(title: "Settings", iconName: "gear", color: .purple) {},
        CarouselButton(title: "Settings", iconName: "gear", color: .purple) {},
        CarouselButton(title: "Settings", iconName: "gear", color: .purple) {}
    ])
}

struct CarouselButton: Identifiable {
    let id = UUID()
    let title: String
    let iconName: String
    let color: Color
    let action: () -> Void
}

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Text("Button Carousel")
//                .font(.largeTitle)
//            
//            ButtonCarousel(buttons: [
//                CarouselButton(title: "Home", iconName: "house", color: .blue) {
//                    print("Home tapped")
//                },
//                CarouselButton(title: "Search", iconName: "magnifyingglass", color: .green) {
//                    print("Search tapped")
//                },
//                CarouselButton(title: "Profile", iconName: "person", color: .red) {
//                    print("Profile tapped")
//                },
//                CarouselButton(title: "Settings", iconName: "gear", color: .purple) {
//                    print("Settings tapped")
//                }
//            ])
//        }
//    }
//}
