//
//  NetworkingController.swift
//  RandomZooAnimal
//
//  Created by Brody Sears on 2/9/22.
//

import Foundation
import UIKit.UIImage
import UIKit

class NetworkingController {
    
    private static let baseURLString = "https://zoo-animal-api.herokuapp.com"
    
    static var initialURL: URL? {
        guard let baseURL = URL(string: baseURLString) else { return nil }
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        urlComponents?.path = "/animals/rand"
        
        guard let finalURL = urlComponents?.url else { return nil }
        print(finalURL)
        return finalURL
    }
    
    static func fetchZooAnimal(with url: URL, completion: @escaping (Result<ZooAnimal, ResultError>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(.thrownError(error)))
            }
            guard let zooAnimalData = data  else {
                completion(.failure(.noData))
                return }
            
            do {
                //try
                let zooAnimal = try JSONDecoder().decode(ZooAnimal.self, from: zooAnimalData)
                completion(.success(zooAnimal))
            } catch {
                completion(.failure(.thrownError(error)))
            }
        }.resume()
    }//End of fetchZooAnimal func
    
    static func fetchImage(for zooAnimalImageString: String, completion: @escaping (Result<UIImage, ResultError>) -> Void) {
        guard let imageURL = URL(string: zooAnimalImageString) else { return }
        
        URLSession.shared.dataTask(with: imageURL) { data, _, error in
            if let error = error {
                print("There was an error", error.localizedDescription)
                completion(.failure(.thrownError(error)))
            }
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            guard let zooAnimalImage = UIImage(data: data) else {
                completion(.failure(.unableToDecode))
                return
            }
            completion(.success(zooAnimalImage))
        }.resume()
    }
    
}//End of class
