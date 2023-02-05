//
//  CoctailTableViewCell.swift
//  TheCoctailsAPI
//
//  Created by Armen Madoyan on 03.02.2023.
//

import UIKit

class CoctailTableViewCell: UITableViewCell {
    
    @IBOutlet var drinkImage: UIImageView!{
        didSet {
            drinkImage.contentMode = .scaleAspectFit
            drinkImage.clipsToBounds = true
            drinkImage.layer.cornerRadius = drinkImage.frame.height / 2
            drinkImage.backgroundColor = .white
        }
    }
    
    @IBOutlet var drinkLabel: UILabel!
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var alcpholicLabel: UILabel!
    
    func configure(with drink: Drink?) {
        
        drinkLabel.text = "Drink: \(drink?.strDrink ?? "")"
        categoryLabel.text = "Category: \(drink?.strCategory ?? "")"
        alcpholicLabel.text = "Alcoholic: \(drink?.strAlcoholic ?? "")"
        
        NetworkManager.shared.fetchImage(from: drink?.strDrinkThumb ) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.drinkImage.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
}
