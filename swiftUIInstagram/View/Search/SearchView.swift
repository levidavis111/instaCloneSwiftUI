//
//  SearchView.swift
//  swiftUIInstagram
//
//  Created by Levi Davis on 3/19/21.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    var body: some View {
        
        ScrollView {
//            search bar
            SearchBar(text: $searchText)
                .padding()
            
            //grid view/user list view
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
