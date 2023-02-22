//
//  InformationViewController.swift
//  TheCoctailsAPI
//
//  Created by Armen Madoyan on 30.01.2023.
//

import UIKit
import AlamofireImage

class InformationViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet var imageCoctail: UIImageView! {
        didSet {
            imageCoctail.contentMode = .scaleAspectFill
            imageCoctail.clipsToBounds = true
            imageCoctail.layer.cornerRadius = 15
        }
    }
    
    @IBOutlet var informationLabel: UILabel!
    
    var coctail: Drink!
    
    // MARK: Live Cercle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        title = coctail.strDrink
        fetchDrink(coctail)
    }
    
    
    func fetchDrink(_ drink: Drink?) {
        
        informationLabel.text = drink?.strDrink
        
        guard let imageUrl = URL(string: drink?.strDrinkThumb ?? "") else {return}
        imageCoctail.af.setImage(withURL: imageUrl)
        
//        NetworkManager.shared.fetchImage(from: drink?.strDrinkThumb) { [weak self] result in
//            switch result {
//            case .success(let imageData):
//                self?.imageCoctail.image = UIImage(data: imageData)
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
}

