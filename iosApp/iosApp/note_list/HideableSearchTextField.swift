//
//  HideableSearchTextField.swift
//  iosApp
//
//  Created by Ehsan Taghavi on 20.10.2023.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI

struct HideableSearchTextField<Destination:View>: View {
    
    var onSearchToggled: () -> Void
    var destinationProvider:() -> Destination
    var isSearchActive: Bool
    @Binding var searchText:String
    
    var body: some View {
        HStack {
            TextField("Search...", text: $searchText)
                .textFieldStyle(.roundedBorder)
                .opacity(isSearchActive ? 1 : 0)
            if  !isSearchActive{
                Spacer()
            }
            Button(action: onSearchToggled){
                Image(systemName: isSearchActive ? "xmark":"magnifyingglass")
            }
            NavigationLink(destination: destinationProvider()) {
                Image(systemName: "plus")
            }
        }
    }
}

#Preview {
    HideableSearchTextField(
        onSearchToggled: {},
        destinationProvider: {EmptyView()},
        isSearchActive: true,
        searchText: .constant("Hello")
    )
}
