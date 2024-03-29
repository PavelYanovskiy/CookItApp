//
//  DataService.swift
//  CookItApp
//
//  Created by Павел Яновский on 21.03.2024.
//

import Foundation


class DataService {
    
    static func getLocalData() -> [Recipe] {
        
        // Разбираем локальный json-файл
        
        // Получаем URL-адрес пути к файлу json
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // Проверяем, не равна ли строка пути нулю, в противном случае...
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // Создаем объект url
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // Создаем объект данных
            let data = try Data(contentsOf: url)
            
            // Декодируем данные с помощью JSON-декодера
            let decoder = JSONDecoder()
            
            do {
                
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Добавляем уникальные идентификаторы
                for r in recipeData {
                    r.id = UUID()
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
                
                // возвращаем рецепт
                return recipeData
            }
            catch {
                // ошибка при разборе json
                print(error)
            }
        }
        catch {
            // ошибка при получении данных
            print(error)
        }
        
        return [Recipe]()
    }
    
}
