//
//  PhotosViewModel.swift
//  TipTune
//
//  Created by Juan Angel Luera on 8/16/24.
//

import Foundation
import SwiftUI
import PhotosUI
import FirebaseStorage
import FirebaseFirestore


final class PhotoPickerViewModel: ObservableObject{
    @Published private(set) var selectedImage: UIImage? = nil
    @Published var imageSelection: PhotosPickerItem? = nil{
        didSet {
            setImage(from: imageSelection)
        }
    }
    
    private func setImage(from selection: PhotosPickerItem?) {
        guard let selection else {return}
        
        Task {
//            if let data = try? await selection.loadTransferable(type: Data.self){
//                if let uiImage = UIImage(data:data){
//                    selectedImage = uiImage
//                }
//            }
            do {
                let data = try await selection.loadTransferable(type: Data.self)
                guard let data, let uiImage = UIImage(data:data) else{
                    throw URLError(.badServerResponse)
                }
                selectedImage = uiImage
            }
            catch {
                print(error)
            }
        }
       
    }
    
    
    func uploadPhoto(storage_location: String) {
        do {
            //chech ther is an image selected
            guard self.selectedImage != nil else {return}
            //create storange reference
            let storageRef = Storage.storage().reference()
            //turn image to data and compress it
            let imageData = self.selectedImage?.jpegData(compressionQuality: 0.8)
            guard imageData != nil else {return}
            //make path
            let path = "\(storage_location)/\(UUID().uuidString)"
            let fileRef = storageRef.child(path)
            
            //upload picture
            
            let uploadTask = fileRef.putData(imageData!, metadata: nil) { metadata, error in
                
                if error == nil && metadata != nil {
                    let db = Firestore.firestore()
                    db.collection("images").document().setData(["url":path])
                }
            }
            
        }
        
        
    }
    
    func fetchProfilePicture(path: String) async -> UIImage?{
          
          // Get a reference to storage
        let storageRef = Storage.storage().reference()
          //specify the path
        let fileRef = storageRef.child(path)
        
        do {
               let data = try await fileRef.data(maxSize: 5 * 1024 * 1024)
               return UIImage(data: data)
           } catch {
               print("Failed to fetch image: \(error.localizedDescription)")
               return nil
           }
        
//        var image: UIImage?
//          // get data
//          fileRef.getData(maxSize: 5*1024*1024) { data, error in
//              if error == nil && data != nil {
//                  if let uiImage = UIImage(data: data!){
//                      image = uiImage
//                  }
////                  guard let uiImage = UIImage(data:data!) else {
////                      print("fail")
////                      return}
////                  print("")
////                  image = uiImage
//                  
//              } else{
//                  print("fail")
//              }
//              
//              
//          }
//          return image
          
          
      }
}
