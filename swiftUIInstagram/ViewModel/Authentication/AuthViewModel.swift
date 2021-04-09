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
    @Published var currentUser: AppUser?
    
    static let shared = AuthViewModel()
    let auth = Auth.auth()
    let store = Firestore.firestore()
    
    init() {
        userSession = auth.currentUser
        fetchUser()
    }
    
    func login(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) {[weak self] (result, error) in
            if let error = error {print(error.localizedDescription); return}
            guard let user = result?.user else {return}
            self?.userSession = user
            self?.fetchUser()
        }
    }
    
    func register(email: String, password: String, image: UIImage?, fullName: String,
                  username: String) {
        guard let image = image else {return}
        ImageUploader.uploadImage(image: image) {[weak self] (imageURL) in
            self?.auth.createUser(withEmail: email, password: password) { result, error in
                if let error = error {print(error.localizedDescription); return}
                guard let user = result?.user else {print("No user"); return}
                print("User succesfully registered")
                
                let data = ["email": email,
                            "username": username,
                            "fullName": fullName,
                            "profileImageURL": imageURL,
                            "uid": user.uid]
                
                self?.store.collection(Collection.users).document(user.uid).setData(data, completion: { _ in
                    self?.userSession = user
                })
            }
        }
    }
    
    func signout() {
        do {
            try auth.signOut()
            self.userSession = nil
            self.fetchUser()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func resetPassword() {
        
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else {return}
        store.collection(Collection.users).document(uid).getDocument { (snapshot, _) in
            do {
                let user = try snapshot?.data(as: AppUser.self)
                self.currentUser = user
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
}
