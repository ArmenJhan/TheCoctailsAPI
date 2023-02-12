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
    
//    var information: String {
//            """
//            Drink: \(strDrink)
//            Category: \(strCategory)
//            Alcoholic: \(strAlcoholic)
//            """
//    }
//    
//    var information2: String {
//             """
//            Drink: \(strDrink)
//            Category: \(strCategory)
//            Alcoholic: \(strAlcoholic)
//            Instructions: \(strInstructions)
//            """
//    }
    
    init(drinkData: [String: Any]) {
        strDrink = drinkData["strDrink"] as? String ?? ""
        strCategory = drinkData["strCategory"] as? String ?? ""
        strAlcoholic = drinkData["strAlcoholic"] as? String ?? ""
        strInstructions = drinkData["strInstructions"] as? String ?? ""
        strDrinkThumb = drinkData["strDrinkThumb"] as? String ?? ""
    }
    
    static func getDrinks(from value: Any) -> [Drink] {
        guard let value = value as? [String: Any] else { return [] }
        guard let drinks = value["drinks"] as? [[String: Any]] else { return []}
        return drinks.compactMap { Drink(drinkData: $0)}
    }
}

struct Drinks: Decodable {
    var drinks: [Drink]
    
}
