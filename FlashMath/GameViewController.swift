//
//  GameViewController.swift
//  FlashMath
//
//  Created by Parker Fisher on 4/21/22.
//

import UIKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(true)
        //print(singleton!.hello)
    }

    
    func startGame() {
        print("starting game")
    }
    
    func endGame() {
        print("ending game")
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
    
    /*
    timeLeft = timeLimits[sender.selectedSegmentIndex]
    print("selected time limit " + String(timeLeft))
    resetTimer()
    startGame()
    */
    var gameTimer : Timer? = nil
    var timeLeft : Int = 0
    let timeLimits : [Int] = [30, 60, 90]
}
