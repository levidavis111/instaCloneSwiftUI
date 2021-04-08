//
//  ImageUploader.swift
//  swiftUIInstagram
//
//  Created by Levi Davis on 4/8/21.
//

import UIKit
import Firebase

struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping (String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.75) else {return}
        
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            ref.downloadURL { url, _ in
                guard let imageURL = url?.absoluteString else {return}
                completion(imageURL)
            }
        }
    }
}
