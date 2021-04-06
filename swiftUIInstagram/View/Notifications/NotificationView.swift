//
//  NotificationView.swift
//  swiftUIInstagram
//
//  Created by Levi Davis on 3/19/21.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(0..<20) { _ in
                    NotificationCell()
                        .padding(.top)
                }
            }
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
