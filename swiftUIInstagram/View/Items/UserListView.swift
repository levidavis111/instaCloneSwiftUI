//
//  UserListView.swift
//  swiftUIInstagram
//
//  Created by Levi Davis on 4/6/21.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel: SearchViewModel
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.users) { _ in
                    NavigationLink(
                        destination: ProfileView(),
                        label: {
                            UserCell()
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
