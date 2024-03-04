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
                
                nutritionHolder
                
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
        .accessibilityIdentifier("details.image")
    }
    
    var details: some View {
        VStack(spacing: 16) {
            recipeTitle
            
            servings
            
            dietInfo
            
            healthInfo
        }
        .padding(.horizontal, 24)
    }
    
    var recipeTitle: some View {
        Text(viewModel.title)
            .font(.title)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .accessibilityIdentifier("details.title")
    }
    
    var servings: some View {
        Text("Serves \(Int(viewModel.servings))")
            .font(.body)
            .opacity(0.8)
            .frame(maxWidth: .infinity, alignment: .leading)
            .accessibilityIdentifier("details.servings")
    }
    
    @ViewBuilder
    var dietInfo: some View {
        if !viewModel.dietLabels.isEmpty {
            VStack(alignment: .leading, spacing: 8) {
                dietTitle
                
                dietLabels
            }
        }
    }
    
    var dietTitle: some View {
        Text("Type of diet:")
            .font(.headline)
            .fontWeight(.semibold)
            .accessibilityIdentifier("details.diet.title")
    }
    
    var dietLabels: some View {
        Text(viewModel.dietLabels.map { $0.rawValue }.joined(separator: ", "))
            .font(.footnote)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .lineLimit(2)
            .accessibilityIdentifier("details.diet.labels")
    }
    
    @ViewBuilder
    var healthInfo: some View {
        if !viewModel.healthLabels.isEmpty {
            VStack(alignment: .leading, spacing: 4) {
                healthTitle
                
                healthLabels
            }
        }
    }
    
    var healthTitle: some View {
        Text("Health labels:")
            .font(.headline)
            .fontWeight(.semibold)
            .accessibilityIdentifier("details.health.title")
    }
    
    var healthLabels: some View {
        Text(viewModel.healthLabels.map { $0.rawValue }.joined(separator: ", "))
            .font(.footnote)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .accessibilityIdentifier("details.health.labels")
    }
    
    var nutritionHolder: some View {
        VStack(spacing: 12) {
            nutritionTitle
            
            nutritionInfo
        }
        .padding(.horizontal, 24)
    }
    
    var nutritionTitle: some View {
        Text("Nutrition")
            .font(.title2)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .accessibilityIdentifier("details.nutrition.title")
    }
    
    var nutritionInfo: some View {
        HStack(spacing: 16) {
            macroChart
            
            ForEach(viewModel.macroData) { data in
                VStack(spacing: 4) {
                    Text("\(data.percentile)%")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(data.color)
                        .accessibilityIdentifier("details.info.percentile")
                    
                    Text(String(format: "%.1f g", data.value))
                        .font(.body)
                        .fontWeight(.semibold)
                        .accessibilityIdentifier("details.info.value")
                    
                    Text(data.title)
                        .font(.footnote)
                        .fontWeight(.thin)
                        .accessibilityIdentifier("details.info.title.\(data.title)")
                }
            }
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
        .chartLegend(position: .leading, alignment: .center)
        .accessibilityIdentifier("details.chart")
    }
    
    @ViewBuilder
    var ingredients: some View {
        if !viewModel.ingredients.isEmpty {
            VStack(spacing: 16) {
                ingredientsTitle
                
                ingredientsList
            }
            .padding(.horizontal, 24)
        }
    }
    
    var ingredientsTitle: some View {
        Text("Ingredients")
            .font(.title2)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .accessibilityIdentifier("details.ingredients.title")
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
        .accessibilityIdentifier("details.ingredients.list")
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
        .accessibilityIdentifier("details.dismiss")
    }
}

struct RecipeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailsView(viewModel: .init(recipe: recipe))
    }
}
