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
    @EnvironmentObject var viewModel: AuthViewModel
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
                            
                        
                        ZStack (alignment: .trailing) {
                            InputView(text: $confirmpassword, title: "Confirm Password", placeholder: "1234", isSecureField: true)
                                .autocapitalization(.none)
                            
                            if !password.isEmpty && !confirmpassword.isEmpty {
                                if password == confirmpassword {
                                    Image(systemName: "checkmark")
                                        .imageScale(.large)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(.systemGreen))
                                } else {
                                    Image(systemName: "xmark")
                                        .imageScale(.large)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(.systemRed))
                                }
                                    
                            }
                        }
                        
                        
                    }
                    .padding(.horizontal)
                    .padding(.top, 12)
                
                    
                    Button {
                        Task {
                            try await viewModel.createUser(withEmail: email, password: password, fullname: fullname)
                        }
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

extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && password == confirmpassword
        && !fullname.isEmpty
    }
}

#Preview {
    RegistrationView()
}
