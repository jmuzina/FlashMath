//
//  GameViewController.swift
//  FlashMath
//
//  Created by Parker Fisher on 4/21/22.
//

import UIKit

class GameViewController: UIViewController {

    var startVC: StartViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startVC = self.tabBarController?.viewControllers![0] as? StartViewController
        
        //currentAnswerRef.keyboardType = UIKeyboardType.numberPad
    }
    override func viewDidAppear(_ animated: Bool) {
        timeLeft = gameTimeChoice
        startGame()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }

    
    func startGame() {
        print("starting game")
        resetTimer()
        gameInProgress = true
        createProblem()
    }
    
    func endGame() {
        print("ending game")
        gameInProgress = false
        if (gameTimer != nil) {
            gameTimer?.invalidate()
        }
    }
    
    func createProblem() {
        //var prob : Problem?
        switch(opChoice) {
        case 0:
            prob = AdditionProblem()
        case 1:
            prob = SubtractionProblem()
        case 2:
            prob = MultiplicationProblem()
        case 3:
            prob = DivisionProblem()
        case 4:
            prob = ModulusProblem()
        default:
            prob = AdditionProblem()
            break
        }
        print(prob?.lhs, prob?.rhs)
    }
    
    func attemptSolveProblem(var guess : Int) -> Bool {
        return (prob?.solve() == guess)
    }
    
    func solveProblem() {
        currentAnswerRef.text = ""
        createProblem()
    }
    
    @objc func tick() {
        timeLeft -= 1
        print(timeLeft)
        if (timeLeft <= 0) {
            print("out of time")
            endGame()
        }
    }
    
    func resetTimer() {
        if (gameTimer != nil) {
            gameTimer?.invalidate()
        }
        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
    }
    
    @IBAction func answerChanged(_ sender: UITextField) {
        let answer : Int? = Int(sender.text!)
        
        if (answer != nil) {
            if (attemptSolveProblem(var: answer!)) {
                solveProblem()
            }
        }
        
        
        
    }
    var gameTimer : Timer? = nil
    var timeLeft : Int = 0
    let timeLimits : [Int] = [30, 60, 90]
    var gameTimeChoice: Int = 60
    var opChoice = Int()
    var gameInProgress : Bool = false
    var prob : Problem?
    @IBOutlet weak var currentAnswerRef: UITextField!
}
