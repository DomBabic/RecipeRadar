//
//  BorderedBackground.swift
//  RecipeRadar
//
//  Created by Dominik Babic on 03.03.2024..
//

import SwiftUI

struct BorderedBackground: View {
    
    var cornerRadius: Double = 16
    var lineWidth: Double = 1
    var fill: Color = .black
    
    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .stroke(lineWidth: lineWidth)
            .fill(fill)
    }
}

#Preview {
    BorderedBackground()
}
