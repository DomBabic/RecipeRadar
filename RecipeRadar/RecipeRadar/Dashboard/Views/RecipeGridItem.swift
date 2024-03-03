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
        VStack(spacing: 8) {
            ZStack(alignment: .topLeading) {
                image
                
                prepHolder
            }
            
            title
        }
    }
    
    var image: some View {
        AsyncImage(url: nil) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
        } placeholder: {
            ProgressView()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .background(Color.gray.opacity(0.05))
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
    var title: some View {
        Text(recipe.label)
            .lineLimit(2)
    }
    
    var prepHolder: some View {
        HStack {
            prepTime
            
            Spacer()
        }
        .padding(.all, 16)
    }
    
    var prepTime: some View {
        Text("\(recipe.totalTime) min.")
            .font(.footnote)
            .padding(.horizontal, 8)
            .padding(.vertical, 6)
            .background(Color.orange.opacity(0.5))
            .clipShape(Capsule())
    }
}
