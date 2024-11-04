//
//  ActiveEventView.swift
//  TipTune
//
//  Created by Juan Antonio Luera on 10/13/24.
//

import SwiftUI

struct ActiveEventView: View {
    @State private var activeWidget: WidgetType? = nil
    
    enum WidgetType {
        case liveLyricsWidget
        case giftWidget
        case requestMessageWidget
        case requestSongWidget
    }
    
    var body: some View {
        ZStack{
            Color(.systemGray6).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack(spacing: 20){
                HStack {
                    Button(action: {
                        toggleWidget(.liveLyricsWidget)
                    }) {
                        WidgetButton(iconName: "music.note", label: "Live Lyrics")
                    }
                    
                    Button(action: {
                        toggleWidget(.giftWidget)
                    }) {
                        WidgetButton(iconName: "gift.fill", label: "Gift Page")
                    }
                }
                
                HStack {
                    Button(action: {
                        toggleWidget(.requestMessageWidget)
                    }) {
                        WidgetButton(iconName: "message.fill", label: "Request Message")
                    }
                    
                    Button(action: {
                        toggleWidget(.requestSongWidget)
                    }) {
                        WidgetButton(iconName: "music.mic", label: "Request Song")
                    }
                }
            }
            .padding()
            .animation(.easeInOut, value: activeWidget)
            
            if let active = activeWidget {
                GeometryReader{ geometry in
                    VStack{
                        HStack{
                            Button(action: {closeWidget() }){
                                Image(systemName: "arrow.left")
                                    .foregroundColor(.black)
                                    .padding()
                                    .background(Color.white)
                                    .clipShape(Circle())
                            }
                            Spacer()
                        }
                        widgetView(for: active)
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding(1)
                            .gesture(
                                DragGesture()
                                    .onEnded { gesture in
                                        if gesture.translation.height > 100 {
                                            closeWidget()
                                        }
                                    }
                            )

                    }
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
                }
            }
        }
    }
    
    private func toggleWidget(_ widget: WidgetType) {
        if activeWidget == widget {
            activeWidget = nil
        } else{
            activeWidget = widget
        }
    }
    
    private func closeWidget() {
        activeWidget = nil
    }
    
    @ViewBuilder
        private func widgetView(for widget: WidgetType) -> some View {
            switch widget {
            case .liveLyricsWidget:
                LiveLyricsWidget()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            case .giftWidget:
                GiftWidget()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            case .requestMessageWidget:
                RequestMessageWidget()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            case .requestSongWidget:
                RequestSongWidget(availableSongs: ["Song 1", "Song 2", "Song 3"].map {
                    Song(name: $0, isCustom: false)
                })
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
}

struct WidgetButton: View {
    let iconName: String
    let label: String
    
    var body: some View {
        VStack {
            Image(systemName: iconName)
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .clipShape(Circle())
            
            Text(label)
                .font(.caption)
        }
        .padding()
    }
}


#Preview {
    ActiveEventView()
}

