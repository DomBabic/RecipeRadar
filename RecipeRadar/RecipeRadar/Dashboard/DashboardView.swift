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
            
            VStack(alignment: .leading, spacing: 4) {
                searchBar
                
                errorMessage
            }
            
            content
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
        .sheet(item: $viewModel.selectedRecipe) { item in
            RecipeDetailsView(viewModel: .init(recipe: item))
        }
    }
    
    var title: some View {
        Text("Recipe Radar")
            .font(.headline)
            .fontWeight(.medium)
            .accessibilityIdentifier("dashboard.title")
    }
    
    var searchBar: some View {
        SearchBar(text: $viewModel.text, placeholder: "Search recipes") {
            Task {
                await viewModel.fetchData()
            }
        }
        .accessibilityIdentifier("dashboard.searchBar")
    }
    
    @ViewBuilder
    var errorMessage: some View {
        if viewModel.showError {
            Text("Something went wrong, please try again later.")
                .font(.footnote)
                .fontWeight(.thin)
                .foregroundStyle(.red)
                .transition(.opacity.combined(with: .move(edge: .top)))
                .animation(.easeInOut(duration: 0.33), value: viewModel.showError)
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
        .accessibilityIdentifier("dashboard.emptyView")
    }
    
    var dataView: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 4) {
                spacing
                
                grid
                
                showMore
                
                spacing
            }
        }
        .padding(.horizontal, 4)
        .background(background)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .accessibilityIdentifier("dashboard.dataView")
    }
    
    var grid: some View {
        LazyVGrid(columns: columns, spacing: 8) {
            ForEach(viewModel.data, id: \.self) { item in
                RecipeGridItem(recipe: item)
                    .onTapGesture {
                        viewModel.selectedRecipe = item
                    }
            }
        }
        .accessibilityIdentifier("dashboard.grid")
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
            .accessibilityIdentifier("dashboard.showMore")
        }
    }
    
    var background: some View {
        BorderedBackground()
    }
}

#Preview {
    DashboardView(viewModel: .init(networkService: NetworkService()))
}
