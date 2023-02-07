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
    
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    
    var ingredient: String {
        "Ingredients: \(strIngredient1 ?? "") \(strIngredient2 ?? "") \(strIngredient3 ?? "") \(strIngredient4 ?? "") \(strIngredient5 ?? "") \(strIngredient6 ?? "") \(strIngredient7 ?? "") \(strIngredient8 ?? "") \(strIngredient9 ?? "") \(strIngredient10 ?? "") \(strIngredient11 ?? "") \(strIngredient12 ?? "") \(strIngredient13 ?? "") \(strIngredient14 ?? "") \(strIngredient15 ?? "")"
    }
    
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
            \(ingredient)
            """
    }
}

struct Drinks: Decodable {
    var drinks: [Drink]
}
