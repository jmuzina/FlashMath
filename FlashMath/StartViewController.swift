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
        gameTimeChoice = sender.selectedSegmentIndex
        gameLength = timeLimits[gameTimeChoice]
        
        updateTopScores()
    }
    
    
    // Operator
    @IBOutlet weak var operatorChoice: UISegmentedControl!
    @IBAction func operatorChoice(_ sender: UISegmentedControl) {
        
        opChoice = sender.selectedSegmentIndex
    
        opChoice = sender.selectedSegmentIndex
        
        updateTopScores()
    }
    
    @IBOutlet weak var diffChoice: UISegmentedControl!
    @IBAction func diffChoice(_ sender: UISegmentedControl) {
        difficultyChoice = sender.selectedSegmentIndex
    }
    
    func updateTopScores() {
        if (gameManagers != nil) {
            let mgr: GameManager = gameManagers![(gameTimeChoice)][opChoice]
            let topScore:Item? = mgr.getItem(index: 0)
            
            if (topScore!.score != -1) {
                highScoreHeaderRef.isHidden = false
                topScoreRef.text = "1) " + String(topScore!.score) + " (" + topScore!.difficulty + ")"
                topScoreRef.isHidden = false
                
                let secondScore:Item? = mgr.getItem(index: 1)
                
                if (secondScore!.score != -1) {
                    secondScoreRef.text = "2) " + String(secondScore!.score) + " (" + secondScore!.difficulty + ")"
                    secondScoreRef.isHidden = false
                    
                    let thirdScore:Item? = mgr.getItem(index: 2)
                    
                    if (thirdScore!.score != -1) {
                        thirdScoreRef.text = "3) " + String(thirdScore!.score) + " (" + thirdScore!.difficulty + ")"
                        thirdScoreRef.isHidden = false
                    }
                    else {
                        thirdScoreRef.isHidden = true
                    }
                }
                else {
                    secondScoreRef.isHidden = true
                    thirdScoreRef.isHidden = true
                }
            }
            else {
                highScoreHeaderRef.isHidden = true
                topScoreRef.isHidden = true
                secondScoreRef.isHidden = true
                thirdScoreRef.isHidden = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // gameVC = self.tabBarController?.viewControllers![1] as? GameViewController
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // The destination view controller exists at this point
        
        let dest = segue.destination as! GameViewController
        dest.startVC = self
        
        
         
    }
    @IBOutlet weak var highScoreHeaderRef: UILabel!
    @IBOutlet weak var topScoreRef: UILabel!
    @IBOutlet weak var secondScoreRef: UILabel!
    @IBOutlet weak var thirdScoreRef: UILabel!
    
    var gameTimer : Timer? = nil
    var timeLeft : Int = 0
    let timeLimits : [Int] = [30, 60, 90]
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
