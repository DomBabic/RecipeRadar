//
//  RecipeGridItem.swift
//  RecipeRadar
//
//  Created by Dominik Babic on 03.03.2024..
//

import SwiftUI
import RecipeData

struct RecipeGridItem: View {
    
    let recipe: Recipe
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            image
            
            prepHolder
            
            titleHolder
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
    var image: some View {
        AsyncImage(url: URL(string: recipe.image)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
                .frame(maxWidth: .infinity)
        } placeholder: {
            ProgressView()
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.05))
        }
        .accessibilityIdentifier("recipe.gridItem.image")
    }
    
    var titleHolder: some View {
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                
                title
                
                Spacer()
            }
        }
        .padding(.bottom, 8)
    }
    
    var title: some View {
        Text(recipe.label)
            .font(.footnote)
            .lineLimit(1, reservesSpace: true)
            .padding(.horizontal, 8)
            .padding(.vertical, 6)
            .background(Color.white)
            .clipShape(Capsule())
            .accessibilityIdentifier("recipe.gridItem.title")
    }
    
    @ViewBuilder
    var prepHolder: some View {
        if recipe.totalTime != 0 {
            HStack {
                prepTime
                
                Spacer()
            }
            .padding(.all, 16)
        }
    }
    
    var prepTime: some View {
        Text("\(Int(recipe.totalTime)) min.")
            .font(.footnote)
            .padding(.horizontal, 8)
            .padding(.vertical, 6)
            .background(Color.orange.opacity(0.9))
            .clipShape(Capsule())
            .accessibilityIdentifier("recipe.gridItem.prepTime")
    }
}
