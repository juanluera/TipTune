//
//  RequestSongWidget.swift
//  TipTune
//
//  Created by Juan Antonio Luera on 10/13/24.
//

import SwiftUI
struct Song: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let isCustom: Bool
}

struct RequestSongWidget: View {
    @State private var searchText = ""
    @State private var selectedSongs: [Song] = []
    @State private var showingTipSheet = false
    @State private var tipAmount = 0
    let availableSongs: [Song]
    
    var filteredSongs: [Song]{
        if searchText.isEmpty{
            return availableSongs
        } else {
            return availableSongs.filter
            { $0.name.localizedCaseInsensitiveContains(searchText)
                && !$0.isCustom}
        }
    }
    
    var body: some View {
        VStack{
            SearchBar(text: $searchText)
            
            List{
                ForEach(filteredSongs){ song in
                    Button(action:{
                        addSong(song)
                    }){
                        Text(song.name)
                    }
                }
                
                if !searchText.isEmpty && !filteredSongs.contains(where: {$0.name.localizedCaseInsensitiveContains(searchText) }){
                    
                    Button("Add\"\(searchText)\""){
                        addSong(Song(name: searchText, isCustom: true))
                    }
                }
            }
            .listStyle(PlainListStyle())
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(selectedSongs){ song in
                        SongBubble(song: song, onRemove:{
                            selectedSongs.removeAll{ $0.id == song.id}
                        })
                        
                    }
                }
            }
            .frame(height: 50)
            
            Button("Request Songs"){
                showingTipSheet = true
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .disabled(selectedSongs.isEmpty)
        }
        .padding()
        .sheet( isPresented: $showingTipSheet){
            VStack {
                Stepper("Tip amount: $\(tipAmount)", value: $tipAmount, in: 0...20, step: 1)
                    .padding()
                Button("Confirm") {
                    requestSongs()
                    showingTipSheet = false
                }
            
                    .padding()
                Button("No tip 😢 ") {
                    tipAmount = 0
                    requestSongs()
                    showingTipSheet = false
                }
            }

        }
    }
    
    private func addSong(_ song: Song){
        if !selectedSongs.contains(where: {$0.id == song.id}){
            selectedSongs.append(song)
        }
        searchText = ""
    }
    
    private func requestSongs(){
        //Handle the song request and tipping logic here
        print("Requesting songs: \(selectedSongs.map{ $0.name }.joined(separator: ",")) with tip  $\(tipAmount)")
        
        selectedSongs = []
        tipAmount = 0
    }
}

struct SearchBar: View{
    @Binding var text: String
    var body: some View {
        HStack{
            TextField("Search songs", text: $text )
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            if !text.isEmpty {
                Button(action: {
                    text = ""
                }){
                    
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct SongBubble: View{
    let song:Song
    let onRemove: () -> Void
    
    var body: some View{
        HStack{
            Text(song.name)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(song.isCustom ? Color.green.opacity(0.2): Color.blue.opacity(0.2))
                .cornerRadius(10)
            
            Button(action: onRemove){
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.red)
            }
            .padding(.leading, 5)
            
        }
        .padding(.trailing, 5)
        
    }
}

#Preview {
    let predefinedSongs = ["Song 1", "Song 2","Song3", "Song 4", "Song 5"].map{
        Song(name: $0, isCustom: false)
    }
    return RequestSongWidget(availableSongs: predefinedSongs)
}
