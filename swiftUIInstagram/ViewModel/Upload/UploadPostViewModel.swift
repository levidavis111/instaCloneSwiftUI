//
//  UploadPostViewModel.swift
//  swiftUIInstagram
//
//  Created by Levi Davis on 4/13/21.
//

import SwiftUI
import Firebase

class UploadPostViewModel: ObservableObject {
    let store = Firestore.firestore()
    func uploadPost(caption: String, image: UIImage) {
        guard let user = AuthViewModel.shared.currentUser else {return}
        guard let userID = user.id else {return}
        
        ImageUploader.uploadImage(image: image, type: .post) {[weak self] (imageURL) in
            let data: [String: Any] = ["caption": caption,
                        "timestamp": Timestamp(date: Date()),
                        "likes": 0,
                        "imageURL": imageURL,
                        "ownerUID": userID,
                        "ownerImageURL": user.profileImageURL,
                        "ownerUsername": user.username
                        ]
            
            self?.store.collection(Collection.posts).addDocument(data: data, completion: { _ in
                print("Uploaded post")
            })
        }
    }
}
