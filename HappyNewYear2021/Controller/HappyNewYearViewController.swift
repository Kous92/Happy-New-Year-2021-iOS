//
//  HappyNewYearViewController.swift
//  HappyNewYear2021
//
//  Created by Koussaïla Ben Mamar on 30/12/2020.
//

import UIKit

class HappyNewYearViewController: UIViewController {

    @IBOutlet weak var happyNewYear: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeView(_ sender: Any) {
        // Retour à la vue initiale (ViewController)
        dismiss(animated: true, completion: nil)
    }
    
}
