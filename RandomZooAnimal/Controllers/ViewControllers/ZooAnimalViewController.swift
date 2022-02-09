//
//  ZooAnimalViewController.swift
//  RandomZooAnimal
//
//  Created by Brody Sears on 2/9/22.
//

import UIKit

class ZooAnimalViewController: UIViewController {
    
    // MARK: -IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var animalImage: UIImageView!
    @IBOutlet weak var latinNameLabel: UILabel!
    @IBOutlet weak var animalTypeLabel: UILabel!
    @IBOutlet weak var lifespanLabel: UILabel!
    @IBOutlet weak var dietLabel: UILabel!
    @IBOutlet weak var habitatLabel: UILabel!
    @IBOutlet weak var geoRangeLabel: UILabel!
    
    @IBOutlet weak var refreshButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting the corner radius of the "refreshButton"
        refreshButton.layer.cornerRadius = 10.0
        updateViews()
    }
    // MARK: -Properties
    var zooAnimal: ZooAnimal?
    
    // MARK: -IBActions
    @IBAction func refreshButtonTapped(_ sender: Any) {
        updateViews()
        
    }
    
    // MARK: -Helper Func
    func updateViews() {
        //calling network function 1 to obtain the data from the top level dicitonary using the initial URL
        NetworkingController.fetchZooAnimal(with: NetworkingController.initialURL!) { result in
            switch result {
                //success case
            case .success(let zooAnimal):
                //once we have data and an imageUrl, we can use that url in our fetch image function, to obtain the image
                NetworkingController.fetchImage(for: zooAnimal.imageUrl) {
                    result in
                    switch result {
                        //success case
                    case .success(let zooAnimalImage):
                        DispatchQueue.main.async {
                            //updating UI element values to the value obtained by our network call. String interpolation used to set "static" precursory field text
                            self.animalImage.image = zooAnimalImage
                            self.nameLabel.text = zooAnimal.name
                            self.latinNameLabel.text = ("Latin Name: \(zooAnimal.latinName)")
                            self.animalTypeLabel.text = ("Type: \(zooAnimal.animalType)")
                            self.lifespanLabel.text = ("Lifespan: \(zooAnimal.lifespan)")
                            self.dietLabel.text = ("Diet: \(zooAnimal.diet)")
                            self.habitatLabel.text = ("Habitat: \(zooAnimal.habitat)")
                            self.geoRangeLabel.text = ("Geo range: \(zooAnimal.geoRange)")
                        }
                    case .failure(let error):
                        print("There was an error", error.localizedDescription)
                    }
                }
                
            case .failure(let error):
                print("There was an error", error.localizedDescription)
            }
        }
    }
}
