//
//  SearchBar.swift
//  RecipeRadar
//
//  Created by Dominik Babic on 03.03.2024..
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    
    let placeholder: String
    let onSearch: (()->Void)
    
    @FocusState var isFocused: Bool
    
    var body: some View {
        HStack(spacing: 8) {
            searchInput
            
            searchButton
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(searchBackground)
    }

    var searchInput: some View {
        TextField("Search recipes", text: $text)
            .font(.body)
            .focused($isFocused)
            .submitLabel(.done)
            .onSubmit {
                isFocused = false
                
                onSearch()
            }
            .id("searchTextField")
    }
    
    var searchButton: some View {
        Button {
           isFocused = false
            
            onSearch()
        } label: {
            searchIcon
        }
        .id("searchButton")
    }
    
    var searchIcon: some View {
        Image(systemName: "magnifyingglass")
            .renderingMode(.template)
            .resizable()
            .tint(.black)
            .frame(width: 24, height: 24)
    }
    
    var searchBackground: some View {
        BorderedBackground()
    }
}

#Preview {
    SearchBar(text: .constant(""), placeholder: "Search") {
        print("Search triggered")
    }
}
