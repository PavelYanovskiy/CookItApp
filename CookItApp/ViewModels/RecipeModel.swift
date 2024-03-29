//
//  RecipeModel.swift
//  CookItApp
//
//  Created by Павел Яновский on 21.03.2024.
//

import Foundation


class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        // Создаем экземпляр службы передачи данных и получаем данные
        self.recipes = DataService.getLocalData()
        
        
    }
    
    static func getPorportion(ingredient:Ingredeients, recipeServing:Int, targetServing:Int) -> String {
        var proportion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            // Вычисляем знаменатель и числитель для целевой порции
            denominator *= recipeServing
            numerator *= targetServing
            
            // Находим наибольший общий делитель
            let divisor = Rational.greatestCommonDivisor(denominator, numerator)
            // Применяем и упрощаем
            denominator /= divisor
            numerator /= divisor
            // Превращаем в целые единицы
            if numerator >= denominator {
                wholePortions = numerator / denominator
                numerator = numerator % denominator
                // Добавляем целые единицы измерения к пропорции
                proportion += String(wholePortions)
            }
            if numerator > 0 {
                proportion += wholePortions > 0 ? " " : ""
                proportion += "\(numerator)/\(denominator)"
            }
        }
        if let unit = ingredient.unit {
            proportion += " " + unit
            if wholePortions > 1 {
                return proportion //+ "s"
            }
        }
        return proportion
    }
}
