//
//  ZooAnimal.swift
//  RandomZooAnimal
//
//  Created by Brody Sears on 2/9/22.
//

import Foundation

//ZooAnimal serves as our top level dictionary
struct ZooAnimal: Decodable {
    //coding keys which are assigned the value of the key's snake case string values
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
    //struct properties containing the data we wish to obtain
    let name: String
    let latinName: String
    let animalType: String
    let lifespan: String
    let habitat: String
    let diet: String
    let geoRange: String
    let imageUrl: String
}
