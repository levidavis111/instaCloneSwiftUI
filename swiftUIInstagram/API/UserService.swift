//
//  UserService.swift
//  swiftUIInstagram
//
//  Created by Levi Davis on 4/9/21.
//

import Foundation
import Firebase

struct UserService {
    static let store = Firestore.firestore()
    
    static func follow(uid: String, completion: ((Error?) -> Void )?) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else {return}
        
        store.collection(Collection.following).document(currentUid)
            .collection(Collection.userFolloring).document(uid).setData([:]) { _ in
                store.collection(Collection.followers).document(uid).collection(Collection.userFollowers).document(currentUid).setData([:], completion: completion)
            }
    }
    
    static func unfollow() {}
    
    static func checkIfUserIsFollowed() {}
}
