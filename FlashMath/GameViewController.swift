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
        gameManagers = [[GameManager]]()
        for (var i) in 0..<timeLimits.count {
            gameManagers?.append([GameManager]())
            for (var j) in 0..<5 {
                gameManagers![i].append(GameManager())
                
            }
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        timeLeft = gameLength
        startGame()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }

    
    func startGame() {
        correct = 0
        resetTimer()
        gameInProgress = true
        timerLabel.text = "Time Remaining: " + String(gameLength)
        updateScoreLabel()
        setLabelVisibility(isGameOver: !gameInProgress)
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
        gameInProgress = false
        if (gameTimer != nil) {
            gameTimer?.invalidate()
        }
        setLabelVisibility(isGameOver: !gameInProgress)
        gameManagers?[gameTimeChoice][opChoice].addItem(matches: correct)
    }
    
    func createProblem() {
        //var prob : Problem?
        switch(opChoice) {
        case 0:
            prob = AdditionProblem()
            opLabel.text = "+"
        case 1:
            prob = SubtractionProblem()
            opLabel.text = "-"
        case 2:
            prob = MultiplicationProblem()
            opLabel.text = "*"
        case 3:
            prob = DivisionProblem()
            opLabel.text = "/"
        case 4:
            prob = ModulusProblem()
            opLabel.text = "%"
        default:
            prob = AdditionProblem()
            opLabel.text = "+"
            break
        }
        let lhsString : String? = String(prob!.lhs)
        let rhsString : String? = String(prob!.rhs)
        lhsLabel.text = lhsString
        rhsLabel.text = rhsString
    }
    
    func attemptSolveProblem(var guess : Int) -> Bool {
        return (prob?.solve() == guess)
    }
    
    func updateScoreLabel() {
        scoreLabel.text = "Score: " + String(correct)
    }
    
    func solveProblem() {
        currentAnswerRef.text = ""
        correct += 1
        createProblem()
        updateScoreLabel()
    }
    
    @objc func tick() {
        timeLeft -= 1
        print(timeLeft)
        if (timeLeft <= 0) {
            endGame()
        }
        else {
            timerLabel.text = "Time Remaining: " + String(timeLeft)
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
    let timeLimits : [Int] = [5, 60, 90]
    var gameTimeChoice: Int = 0
    var gameLength: Int = 60
    var opChoice = Int()
    var gameInProgress : Bool = false
    var prob : Problem?
    var gameManagers : [[GameManager]]?
    var correct : Int = 0
    @IBOutlet weak var currentAnswerRef: UITextField!
    @IBOutlet weak var lhsLabel: UILabel!
    @IBOutlet weak var rhsLabel: UILabel!
    @IBOutlet weak var opLabel: UILabel!
    @IBOutlet weak var gameOverLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
}
