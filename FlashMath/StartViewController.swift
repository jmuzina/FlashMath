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
    @IBAction func gameTimeChanged(_ sender: UISegmentedControl) {
        gameVC!.gameTimeChoice = gameVC!.timeLimits[sender.selectedSegmentIndex]
    }
    
    
    // Operator
    @IBOutlet weak var operatorChoice: UISegmentedControl!
    @IBAction func operatorChoice(_ sender: UISegmentedControl) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameTime.selectedSegmentIndex = 1
        gameVC = self.tabBarController?.viewControllers![1] as? GameViewController
    }
    
    var gameVC:GameViewController?
    
}