//
//  EventSelector.view.swift
//  TipTune
//
//  Created by Juan Antonio Luera on 10/10/24.
//

import SwiftUI

enum EventType: String, CaseIterable {
    case concert = "Concert"
    case meetAndGreet = "Meet & Greet"
    case albumRelease = "Album Release"
    case liveStream = "Live Stream"
    case other = "Other"
}

struct Event: Identifiable {
    let id = UUID()
    let name: String
    let date: Date
    let type: EventType
    let artistName: String
}

struct EventSelector_view: View {
    @State private var isMenuOpen = false
    @State private var selectedEvent: Event?
    
    var body: some View {
        ZStack {
            VStack{
              Text("G")
            }
        }
    }
}

#Preview {
//    let events: [Event] = [
//        Event(name: "Summer Jam", date: Date().addingTimeInterval(86400), type: .concert, artistName: "Various Artists"),
//        Event(name: "Fan Meet Up", date: Date().addingTimeInterval(172800), type: .meetAndGreet, artistName: "Pop Star"),
//        Event(name: "New Album Drop", date: Date().addingTimeInterval(259200), type: .albumRelease, artistName: "Rock Band"),
//        Event(name: "Acoustic Session", date: Date().addingTimeInterval(345600), type: .liveStream, artistName: "Indie Singer"),
//        Event(name: "Charity Gala", date: Date().addingTimeInterval(432000), type: .other, artistName: "Celebrity Host")
//    ]
    
    EventSelector_view()
}
