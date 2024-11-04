//
//  PhotosPicker.swift
//  TipTune
//
//  Created by Juan Angel Luera on 8/6/24.
//

import SwiftUI
import PhotosUI
import FirebaseStorage
import FirebaseFirestore

//@MainActor
//final class PhotoPickerViewModel: ObservableObject{
//    @Published private(set) var selectedImage: UIImage? = nil
//    @Published var imageSelection: PhotosPickerItem? = nil{
//        didSet {
//            setImage(from: imageSelection)
//        }
//    }
//    
//    private func setImage(from selection: PhotosPickerItem?) {
//        guard let selection else {return}
//        
//        Task {
////            if let data = try? await selection.loadTransferable(type: Data.self){
////                if let uiImage = UIImage(data:data){
////                    selectedImage = uiImage
////                }
////            }
//            do {
//                let data = try await selection.loadTransferable(type: Data.self)
//                guard let data, let uiImage = UIImage(data:data) else{
//                    throw URLError(.badServerResponse)
//                }
//                selectedImage = uiImage
//            }
//            catch {
//                print(error)
//            }
//        }
//       
//    }
//    
//    
//    
//}

struct PhotoSelector: View {
    @StateObject private var photosModel = PhotoPickerViewModel()
    @EnvironmentObject var viewModel: AuthViewModel
    @State var retrievedImages = [UIImage]()
    var body: some View {
        VStack(spacing: 40) {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            
            
            PhotosPicker(selection:$photosModel.imageSelection, matching: .images) {
                if let image = photosModel.selectedImage{
                    Image(uiImage:image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .cornerRadius(10)
                } else{
                    Text("Open the photo picker")
                }
                
            }
            
            // Upload Button
            if photosModel.selectedImage != nil {
                Button {
                    print("upload")
                    uploadPhoto()
                } label: {
                    Text("Upload Photo")
                }
            }
            
            Divider() // Divider
            
            ScrollView(.horizontal) {
                HStack{
                    
                    //loop through pictures
                    ForEach(retrievedImages, id: \.self) {
                        image in
                        Image(uiImage:image)
                            .resizable()
                            .frame(width: 200, height: 200)
                        
                        
                    }
                }
            }
        }
        .onAppear(){
            retrievePhoto()
        }
    }
    
    
    func uploadPhoto() {
        guard photosModel.selectedImage != nil else {return}
        //create storage referecne
        let storageRef = Storage.storage().reference()
        //turn image to data
        let imageData = photosModel.selectedImage!.jpegData(compressionQuality: 0.8)
        
        guard imageData != nil else {return}
        // Specify file name and file path
        let path = "images/\(UUID().uuidString).jpg"
        let fileRef = storageRef.child(path)
        //upload data
        let uploadTask = fileRef.putData(imageData!, metadata: nil) { metadata, error in
            
            if error == nil && metadata != nil {
                let db = Firestore.firestore()
                db.collection("images").document().setData(["url":path], completion: { error in
                    if error == nil {
                        self.retrievedImages.append(photosModel.selectedImage!)
                    }
                    
                })
                    
                    
            }
        }
        
        //save a reference to the file in firestore db
    }
    func retrievePhoto() {
        let db = Firestore.firestore()
        
        db.collection("images").getDocuments { snapshot, error in
            print(error)
            if error == nil && snapshot != nil{
                var paths = [String]()
                for doc in snapshot!.documents {
                    //extract the filepath
                    paths.append(doc["url"] as! String)
                }
                
                for path in paths {
                    print("fetching")
                    // Get a reference to storage
                    let storageRef = Storage.storage().reference()
                    //specify the path
                    let fileRef = storageRef.child(path)
                    
                    //retrive the data
                    fileRef.getData(maxSize: 5*1024*1024) { data, error in
                        //check for error
                        if error == nil && data != nil{
                            if let image = UIImage(data: data!){
                                DispatchQueue.main.async{
                                    self.retrievedImages.append(image)
                                }
                            }
                        }
                        
                        
                        
                    }
                    
                }
            }
        }
        
    }
}

#Preview {
    PhotoSelector().environmentObject(AuthViewModel())
}
