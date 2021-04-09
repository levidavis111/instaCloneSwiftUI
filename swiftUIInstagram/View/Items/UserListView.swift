//
//  UserListView.swift
//  swiftUIInstagram
//
//  Created by Levi Davis on 4/6/21.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel: SearchViewModel
    @Binding var searchText: String
    
    var appUsers: [AppUser] {
        return searchText.isEmpty ? viewModel.users : viewModel.filterUsers(searchText)
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(appUsers) { appUser in
                    NavigationLink(
                        destination: ProfileView(user: appUser),
                        label: {
                            UserCell(appUser: appUser)
                                .padding(.leading)
                        })
                }
            }
        }
    }
}

//struct UserListView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserListView()
//    }
//}
