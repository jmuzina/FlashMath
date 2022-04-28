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
        //gameVC!.gameTimeChoice = gameVC!.timeLimits[sender.selectedSegmentIndex]
        
        gameTimeChoice = sender.selectedSegmentIndex
        gameLength = timeLimits[gameTimeChoice]
        print("Time changed to", String(gameLength))
        
    }
    
    
    // Operator
    @IBOutlet weak var operatorChoice: UISegmentedControl!
    @IBAction func operatorChoice(_ sender: UISegmentedControl) {
        
        opChoice = sender.selectedSegmentIndex
        print("Operator changed", String(opChoice))
        
        opChoice = sender.selectedSegmentIndex
        print("Operator changed", String(opChoice))
    }
    
    @IBOutlet weak var diffChoice: UISegmentedControl!
    @IBAction func diffChoice(_ sender: UISegmentedControl) {
        difficultyChoice = sender.selectedSegmentIndex
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // gameVC = self.tabBarController?.viewControllers![1] as? GameViewController
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // The destination view controller exists at this point
        print("StartScene \(#function)", segue.destination)
        
        let dest = segue.destination as! GameViewController
        dest.startVC = self
         
    }
        
    var gameTimer : Timer? = nil
    var timeLeft : Int = 0
    let timeLimits : [Int] = [5, 60, 90]
    var gameTimeChoice: Int = 0
    var gameLength: Int = 60
    var opChoice = Int()
    var difficultyChoice = Int()
    let difficultyStrings : [String] = ["Easy", "Hard"]
    let difficultyMaxes : [Int] = [9, 13]
    var gameInProgress : Bool = false
    var prob : Problem?
    var gameManagers : [[GameManager]]?
    var correct : Int = 0
    
}
