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
                    
                    VStack(spacing: 20) {
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
                    }
                    
                    //forgot password button
                    HStack {
                        Spacer()
                        Button(action: {}, label: {
                            Text("Forgot Password")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.top)
                                .padding(.trailing, 28)
                        })
                    }
                    
                    //sign in button
                    
                    Button(action: {}, label: {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 360, height: 50)
                            .background(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
                            .clipShape(Capsule())
                            .padding()
                    })
                    
                    //go to signup button
                    Spacer()
                    
                    NavigationLink(
                        destination: RegistrationView(),
                        label: {
                            HStack {
                                Text("Don't have an account?")
                                    .font(.system(size: 14))
                                Text("Sign Up")
                                    .font(.system(size: 14, weight: .semibold))
                            }
                            .foregroundColor(.white)
                        })
                        .padding(.bottom, 16)
                    
                }
                .padding(.top, -16)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
