//
//  TipTuneApp.swift
//  TipTune
//
//  Created by Juan Angel Luera on 6/27/24.
//

import SwiftUI
import Firebase

@main
struct TipTuneApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(viewModel)
        }
    }
}

