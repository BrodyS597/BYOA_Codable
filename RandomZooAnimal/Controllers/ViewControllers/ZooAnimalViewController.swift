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

       
    }
    
    // MARK: -IBActions
    @IBAction func refreshButtonTapped(_ sender: Any) {
    }
    
   
}
