//
//  InactiveEventView.swift
//  TipTune
//
//  Created by Juan Antonio Luera on 10/10/24.
//
//Todo actually do this

import SwiftUI


struct InactiveEventView: View {
    let event: Event
    let onRegister: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(event.name)
                .font(.title)
            Text("Artist: \(event.artistName)")
                .font(.headline)
            Text("Type \(event.type.rawValue)")
                .font(.subheadline)
            Text("Date: \(event.date, style: .date)")
            
            Button(action: onRegister){
                Text("RSVP")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

#Preview {
    InactiveEventView(event: Event(name: "Summer Jam", date: Date().addingTimeInterval(86400), type: .concert, artistName: "Various Artists"), onRegister: {print("RSVP clicked")})
    
}
