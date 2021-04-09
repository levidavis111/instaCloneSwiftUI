//
//  ProfileViewModel.swift
//  swiftUIInstagram
//
//  Created by Levi Davis on 4/9/21.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var user: AppUser
    
    init(user: AppUser) {
        self.user = user
    }
    
    func follow() {
        guard let uid = user.id else {return}
        UserService.follow(uid: uid) { _ in
            self.user.isFollowed = true
        }
    }
    
    func unfollow() {}
    
    func checkIfUserIsFollowed() {}
}
