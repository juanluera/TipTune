//
//  ForgotPasswordView.swift
//  TipTune
//
//  Created by Juan Angel Luera on 9/4/24.
//

import SwiftUI

struct ForgotPasswordView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var email: String = ""
    @State private var sentEmail: Bool = false
    @State private var notSent: Bool = true
    
    var body: some View {
        NavigationStack {
            if !sentEmail{
                VStack{
                    // Logo/Title
                    Text("TipTune")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.top, 12)
                    
                    // Sign In
                    VStack(){
                        InputView(text: $email, title: "Email Address", placeholder: "someone@email.com")
                            .autocapitalization(.none)
                        

                        
                        
                    }
                    .padding(.horizontal)
                    .padding(.top, 12)
                    
                    
                    Button{
                        Task {
                            do {
                                notSent = false
                                let check = await viewModel.resetPassword(email: email)
                                
                                if check {
                                    sentEmail = true
                                } else {
                                    print("fail")
                                    sentEmail = false
                                    notSent = true
                                }
                                 
                            }
                        }
                                            } label: {
                        Text("Reset Password")
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                    }
                    
                    .background(.black)
                    .cornerRadius(12)
                    .disabled(!formIsValid && notSent)
                    .opacity(formIsValid ? 1.0 : 0.5)
                    .padding(.top)
                    
                    
                    Spacer()
                    
                   
                }
            } else {
                Spacer()
                Text("You should receive an email in a few minutes")
                Spacer()
                HStack {
                    Text("Didn't get an email")
                    Button {
                        notSent = true
                        sentEmail = false
                        email = ""
                    } label: {
                        Text("try again")
                    }
                }
                
            }
            
        }
    }
}
extension ForgotPasswordView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
    }
}

#Preview {
    ForgotPasswordView().environmentObject(AuthViewModel())
}
