//
//  ProfileView.swift
//  TipTune
//
//  Created by Juan Angel Luera on 7/19/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State var profilePicture: Image?

    var body: some View {
        if let user = viewModel.currentUser {
            List {
                Section { // profile circle
                    ProfilePictureDetail( initials:user.initials,fullname: user.fullname ,email: user.email)
                }
                Section {
                    BalanceDetail()
                }
                
                Section("Acount") {
                    Button {
                        print("Edit Profile")
                    } label: {
                        Text("Edit Profile")
                    }

                    Button {
                        viewModel.signOut()
                    } label: {
                        Text("sign out")
                    }
                                    }
                
            }.onAppear(){
                Task {
                    
                }
            }
        }
    }
    
}

#Preview {
    ProfileView().environmentObject(AuthViewModel())
}
