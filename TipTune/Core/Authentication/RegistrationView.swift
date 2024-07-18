//
//  RegistrationView.swift
//  TipTune
//
//  Created by Juan Angel Luera on 7/18/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmpassword = ""
    @Environment(\.dismiss) var dismiss
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
                        InputView(text: $fullname, title: "Full Name", placeholder: "John Appleseed")
                            
                        
                        InputView(text: $email, title: "Email Address", placeholder: "someone@email.com")
                        .autocapitalization(.none)
                        InputView(text: $password, title: "Password", placeholder: "1234", isSecureField: true)
                            .autocapitalization(.none)
                            
                        
                        InputView(text: $confirmpassword, title: "Confirm Password", placeholder: "1234", isSecureField: true)
                        .autocapitalization(.none)
                        
                        
                    }
                    .padding(.horizontal)
                    .padding(.top, 12)
                
                    
                    Button {
                        print("Create Accout")
                    } label: {
                        HStack {
                            Text("Sign Up")
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
                    
                    Button {
                        dismiss()
                    } label: {
                        HStack {
                            Text("Already have an account")
                            Text("Sign In")
                                .fontWeight(.bold)
                        }
                    }
                    
                    
                }
            }
        }
    }
}

#Preview {
    RegistrationView()
}
