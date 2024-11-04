//
//  ArtistPageView.swift
//  TipTune
//
//  Created by Juan Antonio Luera on 10/8/24.
//

import SwiftUI


struct ArtistPageView: View {
    @State private var videos: [VideoItem] = []
    let videoDirectoryPath = "Users/juanantonioluera/Documents/tiptune/TipTuneAppGit/TipTune/TipTune/Videos/"
    
    var body: some View {
        CustomNavBar(
            logo: Image(systemName: "photo"),
            onReturnTapped: { print("Return tapped") },
            onArtistPageTapped: { print("Artist Page tapped") },
            onEventsTapped: { print("Events tapped") },
            onAnnouncementsTapped: { print("Announcements tapped") },
            onShopTapped: { print("Shop tapped") }
        )
        Text("TITLE")
        VideoCarousel(videos: videos)
            .onAppear(perform: loadVideos)
        
        Spacer()
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
    ArtistPageView()
}
