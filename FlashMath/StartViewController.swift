//
//  ViewController.swift
//  FlashMath
//
//  Created by J. Muzina on 3/24/22.
//

import UIKit

class StartViewController: UIViewController {

    
    
    // Game Time
    @IBOutlet weak var gameTime: UISegmentedControl!
    @IBAction func gameTime(_ sender: UISegmentedControl) {
    }
    
    // Operator
    @IBOutlet weak var operatorChoice: UISegmentedControl!
    @IBAction func operatorChoice(_ sender: UISegmentedControl) {
    }
    
    // Start Game Button
    @IBOutlet weak var startGame: UIButton!
    @IBAction func startGame(_ sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

