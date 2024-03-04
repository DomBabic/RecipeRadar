//
//  RecipeDetailsView.swift
//  RecipeRadar
//
//  Created by Dominik Babic on 04.03.2024..
//

import SwiftUI
import RecipeData
import Charts

struct RecipeDetailsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewModel: RecipeDetailsViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 16) {
                image
                
                details
                
                nutritionInfo
                
                ingredients
                
                Spacer()
                    .frame(height: 16)
            }
            .overlay(dismissHolder)
        }
    }
    
    var image: some View {
        AsyncImage(url: URL(string: viewModel.image)) { image in
            image
                .resizable()
                .scaledToFill()
        } placeholder: {
            ProgressView()
                .aspectRatio(contentMode: .fill)
        }
    }
    
    var details: some View {
        VStack(spacing: 8) {
            recipeTitle
            
            servings
        }
        .padding(.horizontal, 24)
    }
    
    var recipeTitle: some View {
        Text(viewModel.title)
            .font(.title)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var servings: some View {
        Text("Serves \(Int(viewModel.servings))")
            .font(.body)
            .opacity(0.8)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var nutritionInfo: some View {
        HStack(spacing: 24) {
            Spacer()
                .frame(width: 0)
            
            macroChart
            
            ForEach(viewModel.macroData) { data in
                VStack(spacing: 4) {
                    Text("\(data.percentile)%")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(data.color)
                    
                    Text(String(format: "%.1f g", data.value))
                        .font(.body)
                        .fontWeight(.semibold)
                    
                    Text(data.title)
                        .font(.footnote)
                        .fontWeight(.thin)
                }
            }
            
            Spacer()
                .frame(width: 0)
        }
    }
    
    let chartColors: [Color] = [
        .blue,
        .green,
        .orange,
        .yellow,
        .purple
    ]
    
    var macroChart: some View {
        Chart(viewModel.macroData, id: \.title) { data in
            SectorMark(
                angle: .value(data.title, data.value),
                innerRadius: .ratio(0.8),
                angularInset: 8
            )
            .cornerRadius(8)
            .foregroundStyle(by: .value(data.title,
                                        data.title))
        }
        .chartForegroundStyleScale(domain: viewModel.macroData.map { $0.title },
                                   range: viewModel.macroData.map { $0.color })
        .chartLegend(position: .automatic, alignment: .center)
    }
    
    var ingredients: some View {
        VStack(spacing: 16) {
            ingredientsTitle
            
            ingredientsList
        }
        .padding(.horizontal, 24)
    }
    
    var ingredientsTitle: some View {
        Text("Ingredients")
            .font(.title2)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var ingredientsList: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(viewModel.ingredients, id: \.text) { ingredient in
                HStack(alignment: .top, spacing: 8) {
                    Text("•")
                        .font(.body)
                    
                    Text(ingredient.text)
                        .font(.body)
                }
            }
        }
    }
    
    var dismissHolder: some View {
        VStack(alignment: .trailing) {
            dismissButton
            
            Spacer()
                .frame(maxWidth: .infinity)
        }
        .padding(.all, 24)
    }
    
    var dismissButton: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "xmark.circle.fill")
                .resizable()
                .tint(.white)
                .frame(width: 24, height: 24)
        }
    }
}

struct RecipeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailsView(viewModel: .init(recipe: recipe))
    }
}
