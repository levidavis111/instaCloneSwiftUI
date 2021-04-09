//
//  AppUser.swift
//  swiftUIInstagram
//
//  Created by Levi Davis on 4/9/21.
//

import Foundation
import FirebaseFirestoreSwift

struct AppUser: Codable, Identifiable {
    let username: String
    let fullName: String
    let email: String
    let profileImageURL: String
    @DocumentID var id: String?
    
    var isCurrentUser: Bool {
        return AuthViewModel.shared.userSession?.uid == id
    }
}
