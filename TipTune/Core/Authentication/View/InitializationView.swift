//
//  InitializationView.swift
//  TipTune
//
//  Created by Juan Angel Luera on 7/18/24.
//

import SwiftUI

struct InitializationView: View {
    var body: some View {
        GeometryReader{ geometry in
            let width = min(geometry.size.width,geometry.size.height)
        
            let paddinglogo = width * 0.06
            NavigationStack {
                VStack (spacing: 24) {
                    Text("TipTune")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.top, paddinglogo)
                    
                    Spacer()
                    
                    NavigationLink{
                        RegistrationView()
                    } label: {
                        HStack{
                            Text("Create Account")
                                .font(.body)
                                .fontWeight(.semibold)
                            
                        }
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                    }
                    .background(.black)
                    .cornerRadius(12)
                    
                    
                    
                    NavigationLink {
                        LoginView()
                    } label: {
                        HStack {
                            Text("Sign In")
                                
                        }.font(.body)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                    }
                    .background(Color(UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)))
                    .cornerRadius(12)
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    InitializationView()
}
