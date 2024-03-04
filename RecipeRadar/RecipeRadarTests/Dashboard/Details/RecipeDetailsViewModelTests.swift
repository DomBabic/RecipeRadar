//
//  RecipeDetailsViewModelTests.swift
//  RecipeRadarTests
//
//  Created by Dominik Babic on 04.03.2024..
//

import XCTest
import SwiftUI
@testable import RecipeData
@testable import RecipeRadar

final class RecipeDetailsViewModelTests: XCTestCase {

    func testRecipeDetailsViewModelInitialization() throws {
        let recipe = try JSONDecoder().decode(Recipe.self, from: recipeData)
        
        let viewModel = RecipeDetailsViewModel(recipe: recipe)
        
        XCTAssertEqual(viewModel.title, "Chicken Vesuvio")
        XCTAssertEqual(viewModel.servings, 4.0)
        XCTAssertEqual(viewModel.ingredients.count, 11)
        
        XCTAssertEqual(viewModel.macroData.count, 3)
        XCTAssertEqual(viewModel.macroData[0].title, "Carbs")
        XCTAssertEqual(viewModel.macroData[0].value, 180.0 / 4.0)
        XCTAssertEqual(viewModel.macroData[1].title, "Fat")
        XCTAssertEqual(viewModel.macroData[1].value, 280.0 / 4.0)
        XCTAssertEqual(viewModel.macroData[2].title, "Protein")
        XCTAssertEqual(viewModel.macroData[2].value, 230.0 / 4.0)
        
        XCTAssertEqual(viewModel.healthLabels.count, 9)
        XCTAssertEqual(viewModel.dietLabels.count, 1)
    }

}

extension RecipeDetailsViewModelTests {
    var recipeJSON: String {
        """
        {
            "label": "Chicken Vesuvio",
            "image": "https://edamam-product-images.s3.amazonaws.com/web-img/e42/e42f9119813e890af34c259785ae1cfb.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHgaCXVzLWVhc3QtMSJIMEYCIQDv0%2BO2WPRgJR%2FHQ6gz3rBG5oaTlDxQg3f7gb00j8SD9QIhAJ0LJGUHQ3o%2FV2yAMNjwcUzGkrSxiXeqakb0q2EAvdiXKrkFCHEQABoMMTg3MDE3MTUwOTg2IgyhIknB4tacefXAgwQqlgW46DxQOsfjmSXrizNDFfTGEex9eSZ9AY7YhIBHrWB4Q5JQQ9UFGF%2B88pEpy%2FZ%2FRYXWFtzKLDChzcuoKYsuGlO2%2BVnd3kv5Y8%2F7%2BLWDgPlnB84QNbZml6Zc7eN%2FCJcIsAa%2FnaxhgUYdB%2B4Kxe0lm0cWL7vWNsd9%2BUna%2Ba1naJTA%2BLgCYaiug%2FkI2%2FVjIKAXTN%2F2VRUZOvuKiHPHNYuZeaMqonY6CbDARzOQY3cEyY3TXi909TmpJIJeoI1WVJQmu%2FnoGQ%2F6FCxc6m9c0dtaBk1l9NIKm7NDp0Qb5cusRzbWHWDCFd094YJnGqJyesTND0BEGjPGKsEhQBxkpV4JpJmIRNqeu5JCcQqYvNpfIA7p9ye6HAoG5Ehat%2FvVq2PLsO8jD%2FdXu2yDjf149qETTM4OfRBwUWOkVlZ%2F78Imdr2%2BV1YrD0L8vWO8DfBqe19ci6FyfHAITC2u8LlJqOQnUgmp3gMTNWpYwjvE%2BRBJLxS6TqLIQlS%2BtdKedS34wNOfApqA6aXRTGvLHOJKfGRrBBB2sCY6%2BwqnFE0O7b4RPPJ%2BcEHsHMOlm73ou1LxpwoKK%2BAsIARi0KBGaKxwplbqkErlniEvhVMPg04f0t5OSqrCesHHRTMJCO%2BiMSsd0cKnc3onhnLDLKUiZH2oQnuAlqU4kfxNBH9Sju%2FPpyBP1LyrKLDPWCKfkBnleI%2Byf6cdzoPTM%2BAGz%2Fr5JjB9VH9fZbgwXJmi6la%2Fxzxo9V1Gc77PFoVEVmujXFdpi859PSUApcKYlsS8Hgu1a25uMIRXIXiUmRWXfYENn3pE3wH7bEJEOnJQ5Yf0%2BdHDAT25Z%2FIczQF%2FQYxPPGjw8YkcK1UNZ9khS4Nva4CNam6hvcpmxhxWngZi8Ce%2BdDCW85WvBjqwAXY7pQLWmfpjusujB54EVjWoNqLbVd5jIYUzNRa%2B%2FQq%2B9X166yfuKqlfD5BrKRmH5OzIdkdygyjxWB3q5FNeZK49DTgPxBy1BydLl3HAGdUVlrvknKsGKYC6cAqCiDdYJY8ZAGSQLJLKM2HnFI2CEg4Do3oObWx5x3bE%2FKgIWEz90ZdsJS5oh4zPDsE4F7rXM2bL2e7nvSrOuWC1iqZW8o2oWXYs2oJ11mUMmHLc3wDu&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240304T084831Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFHWQANHE2%2F20240304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=991d6d4757c1e9d4a16a34426bee1a0f04efcef14d0b404a971f2a2f76ce8aba",
            "url":"http://www.seriouseats.com/recipes/2011/12/chicken-vesuvio-recipe.html",
            "yield":4.0,
            "dietLabels":[
                "Low-Carb"
            ],
            "healthLabels":[
                "Mediterranean",
                "Dairy-Free",
                "Gluten-Free",
                "Wheat-Free",
                "Egg-Free",
                "Peanut-Free",
                "Tree-Nut-Free",
                "Soy-Free",
                "Fish-Free",
                "Shellfish-Free",
                "Pork-Free",
                "Red-Meat-Free",
                "Crustacean-Free",
                "Celery-Free",
                "Mustard-Free",
                "Sesame-Free",
                "Lupine-Free",
                "Mollusk-Free",
                "Kosher"
            ],
            "ingredients":[
                { "text":"1/2 cup olive oil" },
                { "text":"5 cloves garlic, peeled" },
                { "text":"2 large russet potatoes, peeled and cut into chunks" },
                { "text":"1 3-4 pound chicken, cut into 8 pieces (or 3 pound chicken legs)" },
                { "text":"3/4 cup white wine" },
                { "text":"3/4 cup chicken stock" },
                { "text":"3 tablespoons chopped parsley" },
                { "text":"1 tablespoon dried oregano" },
                { "text":"Salt and pepper" },
                { "text":"Salt and pepper" },
                { "text":"1 cup frozen peas, thawed" }
            ],
            "totalNutrients":{
                "ENERC_KCAL":{
                    "label":"Energy",
                    "quantity":4300.0,
                    "unit":"kcal"
                },
                "FAT":{
                    "label":"Fat",
                    "quantity":280.0,
                    "unit":"g"
                },
                "CHOCDF":{
                    "label":"Carbs",
                    "quantity":180.0,
                    "unit":"g"
                },
                "PROCNT":{
                    "label":"Protein",
                    "quantity":230.0,
                    "unit":"g"
                }
            },
            "totalDaily":{
                "ENERC_KCAL":{
                    "label":"Energy",
                    "quantity":4300.0,
                    "unit":"kcal"
                },
                "FAT":{
                    "label":"Fat",
                    "quantity":280.0,
                    "unit":"g"
                },
                "CHOCDF":{
                    "label":"Carbs",
                    "quantity":180.0,
                    "unit":"g"
                },
                "PROCNT":{
                    "label":"Protein",
                    "quantity":230.0,
                    "unit":"g"
                }
            },
            "totalTime": 60.0
        }
        """
    }
    
    var recipeData: Data {
        recipeJSON.data(using: .utf8)!
    }
}
