//
//  GiftWidget.swift
//  TipTune
//
//  Created by Juan Antonio Luera on 10/13/24.
//

import SwiftUI

struct GiftWidget: View {
    var body: some View {
        VStack {
            Text("Send a Gift")
                .font(.headline)
            HStack {
                ForEach(["🌹", "🎁", "👏", "❤️"], id: \.self) { emoji in
                    Button(action: {
                        // Handle gift sending
                    }) {
                        Text(emoji)
                            .font(.system(size: 30))
                    }
                    .padding()
                    .background(Color.pink.opacity(0.2))
                    .cornerRadius(10)
                }
            }
        }
    }
}
#Preview {
    GiftWidget()
}
