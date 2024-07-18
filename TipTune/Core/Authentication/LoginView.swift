//
//  LoginView.swift
//  TipTune
//
//  Created by Juan Angel Luera on 7/16/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        GeometryReader { geometry in
            let width = min(geometry.size.width,geometry.size.height)
        
            let paddinglogo = width * 0.06
            NavigationStack {
                VStack {
                    //  Logo
                   
                    Text("TipTune")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.top, paddinglogo)
                    
                        
                    // Sign In
                    VStack(){
                        InputView(text: $email, title: "Email Address", placeholder: "someone@email.com")
                            .autocapitalization(.none)
                        
                        InputView(text: $password, title: "Password", placeholder: "1234", isSecureField: true)
                        .autocapitalization(.none)
                        
                        
                    }
                    .padding(.horizontal)
                    .padding(.top, 12)
                
                    
                    Button {
                        print("Log User In ...")
                    } label: {
                        HStack {
                            Text("Sign In")
                                .fontWeight(.semibold)
                            Image(systemName: "arrow.right")
                        }
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                    }
                    .background(Color(.black))
                    .cornerRadius(12)
                    .padding(.top)
                    Spacer()
                    
                    
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
