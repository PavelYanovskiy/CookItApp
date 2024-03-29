//
//  SwiftUIView.swift
//  CookItAppTests
//
//  Created by Павел Яновский on 21.03.2024.
//

import XCTest
@testable import CookItApp

class RecipeDetailViewTests: XCTestCase {

    func testPortionSelection() {
        let model = RecipeModel()
        let recipe = model.recipes.first!
        
        let detailView = RecipeDetailView(recipe: recipe)
        // Проверим, что начальный размер порции установлен корректно
        XCTAssertEqual(detailView.portionSize, 4)
        

    }
}
