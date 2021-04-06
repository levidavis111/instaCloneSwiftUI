//
//  NotificationCell.swift
//  swiftUIInstagram
//
//  Created by Levi Davis on 4/6/21.
//

import SwiftUI

struct NotificationCell: View {
    @State private var showPostImage = true
    var body: some View {
        HStack {
            Image("dog")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            Text("Doggie")
                .font(.system(size: 14, weight: .semibold)) +
                Text(" liked one of your posts")
                .font(.system(size: 15))
            
            Spacer()
            
            if showPostImage {
                Image("dog")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
            } else {
                Button(action: {}, label: {
                    Text("Follow")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .font(.system(size: 14, weight: .semibold))
                })
            }
        }
        .padding(.horizontal)
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
    }
}
