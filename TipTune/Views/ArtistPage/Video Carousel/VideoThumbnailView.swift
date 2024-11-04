//
//  VideoThumbnailView.swift
//  TipTune
//
//  Created by Juan Antonio Luera on 10/2/24.
//

import SwiftUI
import AVKit
import AVFoundation

struct VideoItem: Identifiable {
    let id = UUID()
    let url: URL
    var title: String {
        url.deletingPathExtension().lastPathComponent
    }
}

struct VideoThumbnailView: View {
    let video: VideoItem
    let onTap: () -> Void
    @State private var thumbnail:UIImage?
    
    var body: some View {
        VStack {
            ZStack {
                if let thumbnail = thumbnail{
                    Image(uiImage: thumbnail)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } else {
                    Color.gray
                }
                Image(systemName: "play.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
            .frame(width: 200, height: 150)
            .cornerRadius(10)
            .onTapGesture(perform: onTap)
            .onAppear(perform: loadThumbnail)
            
            Text(video.title)
                .font(.caption)
                .lineLimit(1)
        }
    }
    
    private func loadThumbnail() {
        let asset = AVAsset(url: video.url)
        let imageGenerator = AVAssetImageGenerator(asset: asset)
        imageGenerator.appliesPreferredTrackTransform = true
        
        
        // TODO make thumbnai loading better
        do {
            let cgImage = try imageGenerator.copyCGImage(at: .zero, actualTime: nil)
            thumbnail = UIImage(cgImage: cgImage)
        } catch {
            print("Failed to generate thumbnail: \(error)")
        }
    }
}

#Preview {
    let fullPath = "Users/juanantonioluera/Documents/tiptune/TipTuneAppGit/TipTune/TipTune/Videos/11.mp4"
    let url = URL(fileURLWithPath: fullPath)
    if FileManager.default.fileExists(atPath: fullPath) {
        let video = VideoItem(url: url)
        return VideoThumbnailView(video: video, onTap: {
            print("tapped")
        })
    } else {
        return Text("Video file not found")
    }
}
