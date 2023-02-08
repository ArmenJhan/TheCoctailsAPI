//
//  Coctail.swift
//  TheCoctailsAPI
//
//  Created by Armen Madoyan on 31.01.2023.
//

enum Link: String {
    case drinksURL = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a"
}




struct Drink: Decodable {
    let strDrink: String
    let strCategory: String
    let strAlcoholic: String
    let strInstructions: String
    let strDrinkThumb: String
    
    var information: String {
            """
            Drink: \(strDrink)
            Category: \(strCategory)
            Alcoholic: \(strAlcoholic)
            """
    }
    
    var information2: String {
             """
            Drink: \(strDrink)
            Category: \(strCategory)
            Alcoholic: \(strAlcoholic)
            Instructions: \(strInstructions)
            """
    }
    
    init(drinkData: [String: Any]) {
        strDrink = drinkData["strDrink"] as? String ?? ""
        strCategory = drinkData["strCategory"] as? String ?? ""
        strAlcoholic = drinkData["strAlcoholic"] as? String ?? ""
        strInstructions = drinkData["strInstructions"] as? String ?? ""
        strDrinkThumb = drinkData["strDrinkThumb"] as? String ?? ""
    }
    
    static func getDrinks(from value: Any) -> [Drink] {
        guard let drinksData = value as? [[String: Any]] else { return [] }
        
        var drinks: [Drink] = []
        
        for drinkData in drinksData {
            let drink = Drink(drinkData: drinkData)
            drinks.append(drink)
        }
        
        return drinks
    }
}

struct Drinks: Decodable {
    var drinks: [Drink]
    
}
