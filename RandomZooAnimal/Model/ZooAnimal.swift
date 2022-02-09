//
//  ZooAnimal.swift
//  RandomZooAnimal
//
//  Created by Brody Sears on 2/9/22.
//

import Foundation

struct ZooAnimal: Decodable {
    private enum CodingKeys: String, CodingKey {
        case name
        case latinName = "latin_name"
        case animalType = "animal_type"
        case lifespan
        case habitat
        case diet
        case geoRange = "geo_range"
        case imageUrl = "image_link"
    }
    
    let name: String
    let latinName: String
    let animalType: String
    let lifespan: String
    let habitat: String
    let diet: String
    let geoRange: String
    let imageUrl: String
}
