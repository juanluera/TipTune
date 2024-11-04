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

struct EventSelectorView: View {
    @State private var isMenuOpen = false
    @State private var selectedEvent: Event?
    let events: [Event]
    
    var body: some View {
        NavigationStack {
            ZStack{
                VStack{
                    if let event = selectedEvent{
                        //Todo
                        Text("TODO add general view")
                        //InactiveEventView(event: event)
                    } else {
                        Text("Select an event from the menu")
                            .font(.title)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(UIColor.systemBackground))
                
                GeometryReader{ geometry in
                    HStack(spacing: 0){
                        VStack(alignment: .leading, spacing : 20) {
                                Text("Events")
                                    .font(.title)
                                    .padding(.top, 40)
                            
                            ScrollView{
                                VStack(alignment: .leading, spacing: 20) {
                                    ForEach(events){event in
                                        Button(action:{
                                            self.selectedEvent = event
                                            withAnimation{
                                                self.isMenuOpen = false
                                            }
                                        }){
                                            VStack(alignment: .leading){
                                                Text(event.name)
                                                    .font(.headline)
                                                Text(event.date, style: .date)
                                                    .font(.subheadline)
                                                Text(event.type.rawValue)
                                                    .font(.caption)
                                                    .foregroundColor(.secondary)
                                            }
                                        }
                                        .foregroundColor(.primary)
                                    }
                                }
                                .padding(.horizontal)
                            }
                            Spacer()
                        }
                        .frame(width: geometry.size.width*0.75)
                        .background(Color(UIColor.secondarySystemBackground))
                        .offset(x: isMenuOpen ? 0 : -geometry.size.width * 0.75)
                        
                        Spacer()
                    }
                }
                .background(Color.black.opacity(isMenuOpen ? 0.5:0))
                .edgesIgnoringSafeArea(.all)
                .gesture(
                    DragGesture()
                        .onEnded{ gesture in
                            withAnimation{
                                self.isMenuOpen = gesture.translation.width > 50
                            }
                        }
                )
            }
            .navigationTitle("Events")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button(action: {
                        withAnimation{
                            self.isMenuOpen.toggle()
                        }
                    }){
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                    }
                }
            }
        }
    }
}

#Preview {
    let events: [Event] = [
        Event(name: "Summer Jam", date: Date().addingTimeInterval(86400), type: .concert, artistName: "Various Artists"),
        Event(name: "Fan Meet Up", date: Date().addingTimeInterval(172800), type: .meetAndGreet, artistName: "Pop Star"),
        Event(name: "New Album Drop", date: Date().addingTimeInterval(259200), type: .albumRelease, artistName: "Rock Band"),
        Event(name: "Acoustic Session", date: Date().addingTimeInterval(345600), type: .liveStream, artistName: "Indie Singer"),
        Event(name: "Charity Gala", date: Date().addingTimeInterval(432000), type: .other, artistName: "Celebrity Host")
    ]
    
    return EventSelectorView(events: events)
}


