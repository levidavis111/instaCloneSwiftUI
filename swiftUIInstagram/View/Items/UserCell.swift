//
//  UserCell.swift
//  swiftUIInstagram
//
//  Created by Levi Davis on 4/6/21.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            //image
            Image("dog")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            //VStack -> userName, fullName
            VStack {
                Text("Doggus")
                Text("Dog von Doggus")
            }
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
