//
//  InformationViewController.swift
//  TheCoctailsAPI
//
//  Created by Armen Madoyan on 30.01.2023.
//

import UIKit

class InformationViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet var imageCoctail: UIImageView!
    @IBOutlet var informationLabel: UILabel!
    
    var coctail: Drink!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = coctail.strDrink
        fetchDrink(coctail)
    }
    
    
    func fetchDrink(_ drink: Drink?) {
        
        informationLabel.text = drink?.information2
        
        NetworkManager.shared.fetchImage(from: drink?.strDrinkThumb) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.imageCoctail.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //    private func fetchData() {
    //        NetworkManager.shared.fetch(Drinks.self, from: Link.drinksURL.rawValue) { [weak self] result in
    //            switch result {
    //            case .success(let drink):
    //                self?.informationLabel.text = drink.information2
    //            case .failure(let error):
    //                print(error)
    //            }
    //        }
    //    }
    
}

