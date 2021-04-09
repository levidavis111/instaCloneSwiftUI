//
//  ProfileViewModel.swift
//  swiftUIInstagram
//
//  Created by Levi Davis on 4/9/21.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    let user: AppUser
    
    init(user: AppUser) {
        self.user = user
    }
    
    func follow() {}
    
    func unfollow() {}
    
    func checkIfUserIsFollowed() {}
}
