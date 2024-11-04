//
//  LiveLyricsWidget.swift
//  TipTune
//
//  Created by Juan Antonio Luera on 10/13/24.
//

import SwiftUI

struct LiveLyricsWidget: View {
    
    @State private var lyrics = [
        "Here comes the sun, doo-doo-doo-doo",
        "Here comes the sun, and I say",
        "It's alrigth",
        "Little Darling, it's been a long, cold, lonely winter",
        "Little Darling. it feels like year since it's been here",
    ]
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                ForEach(lyrics, id: \.self){ line in
                    Text(line)
                        .font(.title2)
                        .padding(.horizontal)
                }
            }
            .padding(.vertical)
        }
        .navigationTitle("Live Lyrics")
    }
}

#Preview {
    LiveLyricsWidget()
}
