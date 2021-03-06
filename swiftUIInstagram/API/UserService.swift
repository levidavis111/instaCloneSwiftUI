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
            .collection(Collection.userFollowing).document(uid).setData([:]) { _ in
                store.collection(Collection.followers).document(uid).collection(Collection.userFollowers).document(currentUid).setData([:], completion: completion)
            }
    }
    
    static func unfollow(uid: String, completion: ((Error?) -> Void )?) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else {return}
        
        store.collection(Collection.following).document(currentUid)
            .collection(Collection.userFollowing).document(uid).delete { _ in
                store.collection(Collection.followers).document(currentUid).delete(completion: completion)
            }
    }
    
    static func checkIfUserIsFollowed(uid: String, completion: @escaping (Bool) -> Void) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else {return}
        
        store.collection(Collection.following).document(currentUid).collection(Collection.userFollowing).document(uid).getDocument { (snapshot, _ ) in
            guard let isFollowed = snapshot?.exists else {return}
            completion(isFollowed)
        }
    }
}
