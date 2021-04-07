//
//  UploadPostView.swift
//  swiftUIInstagram
//
//  Created by Levi Davis on 3/19/21.
//

import SwiftUI

struct UploadPostView: View {
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @State var captionText = ""
    var body: some View {
        VStack {
            if postImage == nil {
                Button(action: {}, label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipped()
                        .padding(.top, 56)
                        .foregroundColor(.black)
                        
                })
            } else {
                HStack(alignment: .top) {
                    Image("dog")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()
                    
                    TextField("Enter your caption...", text: $captionText)
                }
                .padding()
                Button(action: {}, label: {
                    Text("Share")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 360, height: 50)
                        .background(Color.blue)
                        .cornerRadius(5)
                        .foregroundColor(.white)
                })
                .padding()
            }
            
            Spacer()
        }
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView()
    }
}
