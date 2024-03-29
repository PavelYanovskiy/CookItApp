//
//  RecipeListView.swift
//  CookItApp
//
//  Created by Павел Яновский on 21.03.2024.
//

import SwiftUI

struct RecipeListView: View {
    
    // Ссылка на модель представления
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        NavigationView {
            VStack (alignment: .leading) {
                Text("Все рецепты")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 40)
                
                ScrollView {
                    LazyVStack (alignment: .leading) {
                        ForEach(model.recipes) { r in
                            
                            NavigationLink(
                                destination: RecipeDetailView(recipe:r),
                                label: {
                                    
                                    // MARK: элемент строки
                                    HStack(spacing: 20.0) {
                                        Image(r.image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 50, height: 50, alignment: .center)
                                            .clipped()
                                            .cornerRadius(5)
                                        VStack (alignment: .leading){
                                            Text(r.name)
                                                .foregroundColor(.black)
                                                .bold()
                                            highlightView(highlights: r.highlights)
                                                .foregroundColor(.gray)
                                        }
                                    }
                                    
                                })
                            
                            
                            
                        }
                        .navigationBarHidden(true)
                    }
                }
            }
            .padding()
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}

