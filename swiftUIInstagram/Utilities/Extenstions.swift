//
//  Extenstions.swift
//  swiftUIInstagram
//
//  Created by Levi Davis on 4/6/21.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
