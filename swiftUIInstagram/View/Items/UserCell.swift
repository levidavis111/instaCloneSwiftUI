//
//  UserCell.swift
//  swiftUIInstagram
//
//  Created by Levi Davis on 4/6/21.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    let appUser: AppUser
    
    var body: some View {
        HStack {
            //image
            KFImage(URL(string: appUser.profileImageURL))
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            //VStack -> userName, fullName
            VStack(alignment: .leading) {
                Text(appUser.username)
                    .font(.system(size: 14, weight: .semibold))
                    
                Text(appUser.fullName)
                    .font(.system(size: 14))
            }
            Spacer()
        }
    }
}

//struct UserCell_Previews: PreviewProvider {
//    static var previews: some View {
//        UserCell()
//    }
//}
