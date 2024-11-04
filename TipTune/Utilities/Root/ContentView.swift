//
//  ContentView.swift
//  TipTune
//
//  Created by Juan Angel Luera on 6/27/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group{
            if viewModel.userSession != nil {
            } else {
                InitializationView()
            }
        }
    }
}

#Preview {
    ContentView().environmentObject(AuthViewModel())
}
