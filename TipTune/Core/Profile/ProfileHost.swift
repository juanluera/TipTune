//
//  ProfileHost.swift
//  TipTune
//
//  Created by Juan Angel Luera on 8/24/24.
//

import SwiftUI

struct ProfileHost: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.editMode) var editMode
    @State private var draftUser = User.default
    
    var body: some View {
        VStack(alignment: .leading ,spacing: 20){
            HStack{
                if editMode?.wrappedValue == .active{
                    Button("Cancel", role: .cancel) {
                        draftUser = viewModel.currentUser!
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                
                EditButton()
                    
            }.padding(.horizontal)
            if editMode?.wrappedValue == .inactive {
                ProfileView()
                
            } else {
                ProfileEditView(user:$draftUser)
                    .onAppear{
                        draftUser = viewModel.currentUser!
                    }
                    .onDisappear{
                        viewModel.currentUser = draftUser
                    }
            }
        }
    }
}

#Preview {
    ProfileHost().environmentObject(AuthViewModel())
}
