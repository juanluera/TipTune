//
//  RequestMessageWidget.swift
//  TipTune
//
//  Created by Juan Antonio Luera on 10/13/24.
//

import SwiftUI

struct RequestMessageWidget: View {
    @State private var tipAmount = ""
    @State private var message: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter your message", text: $message)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Tip Amount", text: $tipAmount)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
                    Button("Send Message") {
                        print("Message Sent")
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                .padding()
    }
}

#Preview {
    RequestMessageWidget()
}
