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
    @EnvironmentObject var viewModel:AuthViewModel
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
                
                    //sing in button
                    Button {
                        Task {
                          try  await viewModel.signIn(withEmail: email, password: password)
                        }
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
                    .disabled(!formIsValid)
                    .opacity(formIsValid ? 1.0 : 0.5)
                    .cornerRadius(12)
                    .padding(.top)
                    Spacer()
                    
                    
                }
            }
        }
    }
}

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}

#Preview {
    LoginView()
}
