//
//  VideoPlayerView.swift
//  TipTune
//
//  Created by Juan Antonio Luera on 10/1/24.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    @Binding var isPresented: Bool
    let video: VideoItem
    @State private var player: AVPlayer?
    
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
        
            if let player = player {
                VideoPlayer(player: player)
                    .edgesIgnoringSafeArea(.all)
            }
            VStack{
                HStack{
                    Spacer()
                    
                    Button(action:{isPresented = false}){
                        Image(systemName: "xmark.circle.fill")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                    }
                    .padding(.leading, 10) // Adjust padding to position away from edges
                    .padding(.top, 20) // Adjust padding as needed
                }
                Spacer()
            }
        }
        .onAppear {
            player = AVPlayer(url: video.url)
            //player?.play()
            debugPrint("Playing video: \(video.title)")
        }
        .onDisappear {
            player?.pause()
            player = nil
            debugPrint("Video stopped: \(video.title)")
        }
    }
}

#Preview {
    let fullPath = "Users/juanantonioluera/Documents/tiptune/TipTuneAppGit/TipTune/TipTune/Videos/11.mp4"
    let url = URL(fileURLWithPath: fullPath)
    let isPresented = Binding<Bool>(get: { true }, set: { _ in }) // Create a Binding<Bool>
       
    if FileManager.default.fileExists(atPath: fullPath) {
        let video = VideoItem(url: url)
        return VideoPlayerView(isPresented: isPresented , video: video)
    } else {
        return Text("Video file not found")
    }
    
}
