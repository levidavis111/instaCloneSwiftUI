//
//  AuthViewModel.swift
//  swiftUIInstagram
//
//  Created by Levi Davis on 4/8/21.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    static let shared = AuthViewModel()
    let auth = Auth.auth()
    let store = Firestore.firestore()
    init() {
        userSession = auth.currentUser
    }
    
    func login() {
        print("Login")
    }
    
    func register(email: String, password: String, image: UIImage?, fullName: String,
                  username: String) {
        guard let image = image else {return}
        ImageUploader.uploadImage(image: image) {[weak self] (imageURL) in
            self?.auth.createUser(withEmail: email, password: password) { result, error in
                guard error == nil else {print(error?.localizedDescription as Any); return}
                guard let user = result?.user else {print("No user"); return}
                print("User succesfully registered")
                
                let data = ["email": email,
                            "username": username,
                            "fullName": fullName,
                            "profileImageURL": imageURL,
                            "uid": user.uid]
                
                self?.store.collection("/users").document(user.uid).setData(data, completion: { _ in
                    self?.userSession = user
                })
            }
        }
    }
    
    func signout() {
        do {
            try auth.signOut()
            self.userSession = nil
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func resetPassword() {
        
    }
    
    func fetchUser() {
        
    }
}
