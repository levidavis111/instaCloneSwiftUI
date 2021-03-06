//
//  SearchViewModel.swift
//  swiftUIInstagram
//
//  Created by Levi Davis on 4/9/21.
//

import SwiftUI
import Firebase

class SearchViewModel: ObservableObject {
    @Published var users = [AppUser]()
    let store = Firestore.firestore()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        store.collection(Collection.users).getDocuments { (snapshot, _) in
            guard let documents = snapshot?.documents else {return}
            
            let appUsers = documents.compactMap({try? $0.data(as: AppUser.self)})
            
            self.users = appUsers
        }
    }
    
    func filterUsers(_ query: String) -> [AppUser] {
        let lowercasedQuery = query.lowercased()
        
        return users.filter{$0.fullName.lowercased().contains(lowercasedQuery) || $0.username.lowercased().contains(lowercasedQuery)}
    }
}
