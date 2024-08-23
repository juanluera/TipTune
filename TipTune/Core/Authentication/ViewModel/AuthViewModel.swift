//
//  AuthViewModel.swift
//  TipTune
//
//  Created by Juan Angel Luera on 7/24/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import FirebaseStorage
import FirebaseFirestore
import UIKit
import SwiftUI


protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}
@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init(){
        self.userSession = Auth.auth().currentUser
        Task{
            await fetchUser()
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws  {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("failed to log in with error \(error.localizedDescription)")
        }
    }
    
    func createUser(withEmail email: String, password: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, balance: 0,fullname: fullname, email: email)
            let encodeUser =  try Firestore.Encoder().encode(user) 
            try await Firestore.firestore().collection("users").document(user.id).setData(encodeUser)
            await fetchUser()
        } catch {
            print("failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut() //signs out on backend
            self.userSession = nil //wipes out user session and takes back to initial view
            self.currentUser = nil //wipe out current user
        } catch {
            print("Debug: \(error.localizedDescription)")
        }
    }
    
    func deleteAccount() {
        
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else {return}

        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: User.self)
        
        print("Debug current user is \(self.currentUser)")
        if self.currentUser == nil {
            Task {
                signOut()
            }
        }
    }
    
    func uploadProfilePicture(image: UIImage!) {
        // get uid
        guard let uid = Auth.auth().currentUser?.uid else {
            print("fail 1")
            return}
        //create storage ref
        let storageRef = Storage.storage().reference()
        //turn image to data
        let imageData = image!.jpegData(compressionQuality: 0.8)
        
        guard imageData != nil else {
            print("fail 2")
            return}
        
        // Specify file name and file path
        let path = "images/\(UUID().uuidString).jpg"
        let fileRef = storageRef.child(path)
        
        //upload Data
        
        let uploadTask = fileRef.putData(imageData!, metadata: nil) { metadata, error in
            
            if error == nil && metadata != nil {
                let db = Firestore.firestore()
                
                db.collection("users").document(uid).updateData(["url": path])
            }
            else{
                print("fail 3")
            }
        }
    }
    
//    func fetchProfilePicture() async -> Image?{
//          //init uid
//          guard let uid = Auth.auth().currentUser?.uid else {return nil}
//          //reference to databasae
//          let db = Firestore.firestore()
//          //get snapshot for user
//          guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return nil}
//          //select url path for profile picture
//          let path = (snapshot["url"] as! String)
//          // Get a reference to storage
//          let storageRef = Storage.storage().reference()
//          //specify the path
//          let fileRef = storageRef.child(path)
//        
//        var image: Image?
//          // get data
//          fileRef.getData(maxSize: 5*1024*1024) { data, error in
//              if error == nil && data != nil {
//                  
//                  guard let uiImage = UIImage(data:data!) else {return}
//                  
//                  image = Image(uiImage:uiImage)
//                  
//              }
//              
//              
//          }
//          return image
//          
//          
//      }
      
    
}
