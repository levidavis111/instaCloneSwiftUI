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
    let auth = Auth.auth()
    init() {
        userSession = auth.currentUser
    }
    
    func login() {
        print("Login")
    }
    
    func register(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { result, error in
            guard error == nil else {print(error?.localizedDescription); return}
            guard let user = result?.user else {print("No user"); return}
            self.userSession = user
            print("User succesfully registered")
        }
    }
    
    func signout() {
        self.userSession = nil
        do {
            try auth.signOut()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func resetPassword() {
        
    }
    
    func fetchUser() {
        
    }
}
