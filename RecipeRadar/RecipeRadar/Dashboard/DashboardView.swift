//
//  DashboardView.swift
//  RecipeRadar
//
//  Created by Dominik Babic on 03.03.2024..
//

import SwiftUI
import RecipeAPI
import RecipeData

struct DashboardView: View {
    
    @StateObject var viewModel: DashboardViewModel
    
    @FocusState var isFocused: Bool
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(spacing: 24) {
            title
            
            searchBar
            
            content
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
    }
    
    var title: some View {
        Text("Recipe Radar")
            .font(.headline)
            .fontWeight(.medium)
    }
    
    var searchBar: some View {
        SearchBar(text: $viewModel.text, placeholder: "Search recipes") {
            Task {
                await viewModel.fetchData()
            }
        }
    }
    
    @ViewBuilder
    var content: some View {
        if viewModel.data.isEmpty {
            emptyView
        } else {
            dataView
        }
    }
    
    var emptyView: some View {
        VStack {
            Spacer()
            
            Text("No results")
                .font(.body)
                .fontWeight(.thin)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(background)
    }
    
    var dataView: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 4) {
                spacing
                
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(viewModel.data, id: \.self) { item in
                        RecipeGridItem(recipe: item)
                    }
                }
                
                showMore
                
                spacing
            }
        }
        .padding(.horizontal, 4)
        .background(background)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
    var spacing: some View {
        Spacer()
            .frame(height: 0)
    }
    
    @ViewBuilder
    var showMore: some View {
        if viewModel.hasMore {
            Button {
                Task {
                    await viewModel.fetchData()
                }
            } label: {
                Text("Show more")
                    .font(.footnote)
            }
            .tint(.white)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(Color.blue.opacity(0.8))
            .clipShape(Capsule())
        }
    }
    
    var background: some View {
        BorderedBackground()
    }
}

#Preview {
    DashboardView(viewModel: .init(networkService: NetworkService()))
}
