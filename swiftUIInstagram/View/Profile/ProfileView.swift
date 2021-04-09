//
//  ProfileView.swift
//  swiftUIInstagram
//
//  Created by Levi Davis on 3/19/21.
//

import SwiftUI

struct ProfileView: View {
    let user: AppUser
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                ProfileHeaderView(appUser: user)
                
                PostGridView()
            }
            .padding(.top)
        }
    }
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}
