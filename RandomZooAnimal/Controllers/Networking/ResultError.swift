//
//  ResultError.swift
//  RandomZooAnimal
//
//  Created by Brody Sears on 2/9/22.
//

import Foundation

//creating our enum containing failure cases
enum ResultError: LocalizedError {
    case invalidURL(String)
    case thrownError(Error)
    case noData
    case unableToDecode
    
    //creating our error reasons and corresponding statements 
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Unable to reach the server. Please try again"
        case .thrownError(let error):
            return "Error: \(error.localizedDescription) -> \(error)"
        case .noData:
            return "The server responded with no data. Please try again"
        case .unableToDecode:
            return "The server responded with bad data. Please try again"
        }
    }
}
