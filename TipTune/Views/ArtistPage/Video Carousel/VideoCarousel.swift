//
//  VideoCarousel.swift
//  TipTune
//
//  Created by Juan Antonio Luera on 9/30/24.
//

import SwiftUI
import WebKit

struct VideoCarousel: View {
    let videos: [VideoItem]
    @State private var selectedVideo: VideoItem?
    @State private var isFullScreen = false
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(videos) { video in
                        VideoThumbnailView(video: video) {
                            selectedVideo = video
                            isFullScreen = true
                        }
                    }
                }
                .padding()
            }
            .frame(height: 200)
        }
        .fullScreenCover(item: $selectedVideo) { video in
            //print("Debug: selectedVideo = \(String(describing: selectedVideo))")
            VideoPlayerView(isPresented: $isFullScreen, video: video)
                .onAppear{
                    debugPrint("Presenting full screen video: \(video.title)")
                }
                .onDisappear(){
                    debugPrint("Dismissing full screen video")
                }
            
        }
        .onChange(of: isFullScreen) {
            debugPrint("isFullScreen changed to: \(isFullScreen)")
            if !isFullScreen {
                selectedVideo = nil
            }
        }
        
    }
}



struct HelperView: View {
    @State private var videos: [VideoItem] = []
    let videoDirectoryPath = "Users/juanantonioluera/Documents/tiptune/TipTuneAppGit/TipTune/TipTune/Videos/"
    
    var body: some View {
        VideoCarousel(videos: videos)
            .onAppear(perform: loadVideos)
    }
    
    private func loadVideos() {
        let fileManager = FileManager.default
        guard let enumerator = fileManager.enumerator(atPath: videoDirectoryPath) else {
            print("Failed to create enumerator for directory")
            return
        }
        
        while let filePath = enumerator.nextObject() as? String {
            if filePath.hasSuffix(".mp4") || filePath.hasSuffix(".mov") {
                let fullPath = (videoDirectoryPath as NSString).appendingPathComponent(filePath)
                let url = URL(fileURLWithPath: fullPath)
                videos.append(VideoItem(url: url))
            }
        }
    }
}

#Preview {
    HelperView()
}
