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
        //startVC = self.tabBarController?.viewControllers![0] as? StartViewController
        startVC?.gameManagers = [[GameManager]]()
        let numLimits: Int = (startVC?.timeLimits.count)!
        for (var i) in 0..<numLimits {
            startVC?.gameManagers?.append([GameManager]())
            for (var j) in 0..<5 {
                startVC?.gameManagers![i].append(GameManager())
                
            }
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        startVC?.timeLeft = startVC!.gameLength
        startGame()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }

    
    func startGame() {
        startVC?.correct = 0
        resetTimer()
        startVC?.gameInProgress = true
        timerLabel.text = "Time Remaining: " + String(startVC!.gameLength)
        updateScoreLabel()
        setLabelVisibility(isGameOver: !(startVC!.gameInProgress))
        createProblem()
    }
    
    func setLabelVisibility(isGameOver :Bool) {
        gameOverLabel.isHidden = !isGameOver
        lhsLabel.isHidden = isGameOver
        rhsLabel.isHidden = isGameOver
        opLabel.isHidden = isGameOver
        currentAnswerRef.isHidden = isGameOver
        timerLabel.isHidden = isGameOver
        self.tabBarController?.tabBar.isHidden = !isGameOver
    }
    
    func endGame() {
        startVC?.gameInProgress = false
        if (startVC?.gameTimer != nil) {
            startVC?.gameTimer?.invalidate()
        }
        setLabelVisibility(isGameOver: !(startVC?.gameInProgress)!)
        
        startVC?.gameManagers![(startVC!.gameTimeChoice)][startVC!.opChoice].addItem(matches: startVC!.correct, diff: startVC!.difficultyStrings[startVC!.difficultyChoice])
    }
    
    func createProblem() {
        //var prob : Problem?
        switch(startVC?.opChoice) {
        case 0:
            startVC?.prob = AdditionProblem()
            opLabel.text = "+"
        case 1:
            startVC?.prob = SubtractionProblem()
            opLabel.text = "-"
        case 2:
            startVC?.prob = MultiplicationProblem()
            opLabel.text = "*"
        case 3:
            startVC?.prob = DivisionProblem()
            opLabel.text = "/"
        case 4:
            startVC?.prob = ModulusProblem()
            opLabel.text = "%"
        default:
            startVC?.prob = AdditionProblem()
            opLabel.text = "+"
            break
        }
        let lhsString : String? = String((startVC?.prob!.lhs)!)
        let rhsString : String? = String((startVC?.prob!.rhs)!)
        lhsLabel.text = lhsString
        rhsLabel.text = rhsString
    }
    
    
    func attemptSolveProblem(guess : Int) -> Bool { // took out 'var' before 'guess'
        return (startVC?.prob?.solve() == guess)
    }
    
    func updateScoreLabel() {
        scoreLabel.text = "Score: " + String((startVC?.correct)!)
    }
    
    func solveProblem() {
        currentAnswerRef.text = ""
        startVC?.correct += 1
        createProblem()
        updateScoreLabel()
    }
    
    @objc func tick() {
        startVC?.timeLeft -= 1
        print(startVC?.timeLeft)
        if (startVC!.timeLeft <= 0) {
            endGame()
        }
        else {
            timerLabel.text = "Time Remaining: " + String((startVC?.timeLeft)!)
        }
    }
    
    func resetTimer() {
        if (startVC?.gameTimer != nil) {
            startVC?.gameTimer?.invalidate()
        }
        startVC?.gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
    }
    
    @IBAction func answerChanged(_ sender: UITextField) {
        let answer : Int? = Int(sender.text!)
        
        if (answer != nil) {
            if (attemptSolveProblem(guess: answer!)) {
                solveProblem()
            }
        }
        
        
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        endGame()
    }

    @IBOutlet weak var currentAnswerRef: UITextField!
    @IBOutlet weak var lhsLabel: UILabel!
    @IBOutlet weak var rhsLabel: UILabel!
    @IBOutlet weak var opLabel: UILabel!
    @IBOutlet weak var gameOverLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
}
