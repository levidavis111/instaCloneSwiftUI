//
//  LoginView.swift
//  swiftUIInstagram
//
//  Created by Levi Davis on 4/7/21.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    Image("instagram_logo_transparent")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220, height: 100)
                    
                    //email field
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color.init(white: 1, opacity: 0.15))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    //password field
                    CustomSecureField(text: $password, placeholder: Text("Password"))
                        .padding()
                        .background(Color.init(white: 1, opacity: 0.15))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    //sign in button
                    
                    //go to signup button
                    
                    Spacer()
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
