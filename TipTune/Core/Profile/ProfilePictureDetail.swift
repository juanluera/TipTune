//
//  ProfilePictureDetail.swift
//  TipTune
//
//  Created by Juan Angel Luera on 8/14/24.
//

import SwiftUI

struct ProfilePictureDetail: View {
    @StateObject private var photosModel = PhotoPickerViewModel()
    var url: String?
    var initials: String
    var pictureOnly = false
    var fullname: String
    var email: String
    @State private var profilePicture: UIImage?
    var body: some View {
        
            HStack {
                if (url != nil) {
                    
                    if profilePicture != nil {
                        Image(uiImage:profilePicture!)
                            .resizable()
                            .foregroundColor(Color(.systemGray))
                            .frame(width:72, height: 72)
                            .clipShape(.circle)
                    } else {
                        Image(systemName: "figure.archery")
                            .resizable()
                            .foregroundColor(Color(.systemGray))
                            .frame(width:72, height: 72)
                            .clipShape(.circle)
                    }
                   
                    
                    
                } else {
                    Text(initials)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 72, height: 72)
                        .background(Color(.systemGray3))
                        .clipShape(.circle)
                    
                    
                }
                if !pictureOnly{
                    
                }
                VStack(alignment: .leading, spacing: 4) {
                    Spacer()
                    Text(fullname)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Text(email)
                        .font(.footnote)
                        .foregroundColor(.gray)
                    
                    Spacer()
                }
            }.onAppear(){
                if url != nil {
                    Task {
                        guard let image = await photosModel.fetchProfilePicture(path: url!) else {
                            print("error")
                            return
                        }
                        profilePicture = image
                        
                    }
                }
                
            }
        
        
        }
        
        
}

#Preview {
    ProfilePictureDetail(url: "images/D84B1EEB-4510-4BA8-AC2D-914E13DDE06E.jpg", initials: "JA",fullname:"John Appleseed", email:"someone@email.com")
}
