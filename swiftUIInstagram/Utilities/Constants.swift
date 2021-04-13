//
//  Constants.swift
//  swiftUIInstagram
//
//  Created by Levi Davis on 4/9/21.
//

import Firebase

//let COLLECTION_USERS = Firestore.firestore().collection("users")

enum Collection {
    static let users = "users"
    static let followers = "followers"
    static let following = "following"
    static let userFollowing = "user-following"
    static let userFollowers = "user-followers"
    static let posts = "posts"
}

