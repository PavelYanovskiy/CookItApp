//
//  RecipeTabView.swift
//  CookItApp
//
//  Created by Павел Яновский on 21.03.2024.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        TabView {
            FeaturedView()
                .tabItem {
                    VStack{
                        Image(systemName: "star.fill")
                        Text("Популярное")
                    }
                }
            RecipeListView()
                .tabItem {
                    VStack{
                        Image(systemName: "list.bullet")
                        Text("Список рецептов")
                    }
                }
        }
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
            .environmentObject(RecipeModel())
    }
}
