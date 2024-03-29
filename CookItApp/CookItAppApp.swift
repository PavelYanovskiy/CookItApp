//
//  CookItAppApp.swift
//  CookItApp
//
//  Created by Павел Яновский on 21.03.2024.
//

import SwiftUI

@main
struct Recipe_List_App: App {
    var body: some Scene {
        WindowGroup {
            RecipeTabView()
                .environmentObject(RecipeModel())
        }
    }
}
