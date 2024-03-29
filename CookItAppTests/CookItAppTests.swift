//
//  CookItAppTests.swift
//  CookItAppTests
//
//  Created by Павел Яновский on 21.03.2024.
//

import XCTest

@testable import CookItApp

class RecipeModelTests: XCTestCase {

    func testLoadingData() {
        let model = RecipeModel()
        XCTAssertFalse(model.recipes.isEmpty, "Recipes should be loaded")
    }

    func testRecipeParsing() {
        let testData = """
        {
            "name": "Test Recipe",
            "featured": false,
            "image": "test_recipe_image",
            "description": "This is a test recipe",
            "prepTime": "10 minutes",
            "cookTime": "20 minutes",
            "totalTime": "30 minutes",
            "servings": 4,
            "highlights": ["Test", "Healthy"],
            "ingredients": [{"name": "Test Ingredient", "num": 1}],
            "directions": ["Test direction 1", "Test direction 2"]
        }
        """.data(using: .utf8)!
        
        do {
            let decoder = JSONDecoder()
            let recipe = try decoder.decode(Recipe.self, from: testData)
            XCTAssertEqual(recipe.name, "Test Recipe")
            XCTAssertEqual(recipe.servings, 4)
            // Другие проверки для полей
        } catch {
            XCTFail("Failed to parse recipe: \(error)")
        }
    }
}

