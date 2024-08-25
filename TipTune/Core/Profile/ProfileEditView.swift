//
//  ProfieEditView.swift
//  TipTune
//
//  Created by Juan Angel Luera on 8/19/24.
//

import SwiftUI
import PhotosUI

struct ProfileEditView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @Binding var user:User
    @StateObject private var photosModel = PhotoPickerViewModel()
    var body: some View {
        List {
            Section{
                HStack {
                    Text("Username: ")
                    Spacer()
                    TextField("Username", text:$user.fullname)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.leading)
                }
            }
            Section{
                VStack{
                    ProfilePictureDetail(url: user.url, initials:user.initials,fullname: user.fullname ,email: user.email)
                    
                    PhotosPicker(selection:$photosModel.imageSelection, matching: .images) {
                        if photosModel.selectedImage != nil{
                            Text("Select a Different photo")
                        } else{
                            Text("Open the photo picker")
                        }
                        
                    }
                }
                if let image = photosModel.selectedImage{
                    
                    HStack {
                        Image(uiImage:image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                        .cornerRadius(10)
                        
                        Button{
                            print("upload")
                            Task {
                                do {
                                    await viewModel.uploadProfilePicture(image: image)
                                }
                            }
                            
                        } label: {
                            Text("upload Photo")
                        }
                    }
                }
                
            }
            
            
          
            
            
            
        }
    }
}

#Preview {
    ProfileEditView(user: .constant(User.MOCK_USER)).environmentObject(AuthViewModel())
}
