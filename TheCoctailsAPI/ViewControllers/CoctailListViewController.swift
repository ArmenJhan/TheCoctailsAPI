//
//  CoctailListViewController.swift
//  TheCoctailsAPI
//
//  Created by Armen Madoyan on 03.02.2023.
//

import UIKit

class CoctailListViewController: UITableViewController {
    
    private var drink: Drinks?
    private var coctails: [Drink] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
        fetchData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        drink?.drinks.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let cell = cell as? CoctailTableViewCell else { return UITableViewCell() }
        
        let drink = drink?.drinks[indexPath.row]
        cell.configure(with: drink)

        return cell
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let informationVC = segue.destination as? InformationViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        informationVC.coctail = drink?.drinks[indexPath.row]
    }
    
    
    private func fetchData() {
        NetworkManager.shared.fetchData(from: Link.drinksURL.rawValue) { [weak self] result in
            switch result {
            case .success(let drinks):
                self?.drink = drinks
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    

    private func fetchImage(_ drink: Drink?,for image: UIImageView ) {
        NetworkManager.shared.fetchImage(from: drink?.strDrinkThumb) { result in
            switch result {
            case .success(let imageData):
                image.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
}
