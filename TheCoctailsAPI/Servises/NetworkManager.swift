//
//  NetworkManager.swift
//  TheCoctailsAPI
//
//  Created by Armen Madoyan on 03.02.2023.
//

import Foundation
import Alamofire

enum NetworkError: Error  {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchImage(from url: String?, complition: @escaping(Result<Data, NetworkError>) -> Void) {
            guard let url = URL(string: url ?? "") else {
                complition(.failure(.invalidURL))
                return
            }
            DispatchQueue.global().async {
                guard let imageData = try? Data(contentsOf: url) else {
                    complition(.failure(.noData))
                    return }
                DispatchQueue.main.async {
                    complition(.success(imageData))
                }
            }
        }
    
    func fetchCoctails(from url: String, completion: @escaping(Result<[Drink], AFError>) -> Void) {
        AF.request(url).validate().responseJSON { dataResponse in
            switch dataResponse.result {
            case .success(let value):
                let drinks = Drink.getDrinks(from: value)
                completion(.success(drinks))
            case .failure(let error):
                completion(.failure(error))
                print(error)
            }
        }
    }
}
