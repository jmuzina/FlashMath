//
//  Problem.swift
//  FlashMath
//
//  Created by Parker Fisher on 4/21/22.
//

import Foundation

class Problem {
    init() {
        lhs = Int.random(in: 0...12)
        rhs = Int.random(in: 0...12)
    }
    
    func solve () -> Int {
        return 0
    }
    
    var lhs : Int = 0
    var rhs : Int = 0
}

class AdditionProblem : Problem {
    override init() {
        super.init()
    }
    override func solve() -> Int {
        return lhs + rhs
    }
}

class SubtractionProblem : Problem {
    override init() {
        super.init()
        var generatedNumbers : Bool = false
        while (!generatedNumbers) {
            lhs = Int.random(in: 0...12)
            rhs = Int.random(in: 0...12)
            if (solve() > 0) {
                generatedNumbers = true
            }
        }
    }
    override func solve() -> Int {
        return lhs - rhs
    }
}

class MultiplicationProblem : Problem {
    override init() {
        super.init()
    }
    override func solve() -> Int {
        return lhs * rhs
    }
}

class DivisionProblem : Problem {
    override init() {
        super.init()
        var generatedNumbers : Bool = false
        while (!generatedNumbers) {
            lhs = Int.random(in: 0...12)
            rhs = Int.random(in: 1...12)
            if ((lhs % rhs) == 0) {
                generatedNumbers = true
            }
        }
    }
    override func solve() -> Int {
        return lhs / rhs
    }
}

class ModulusProblem : Problem {
    override init() {
        super.init()
        lhs = Int.random(in: 0...12)
        rhs = Int.random(in: 1...12)
    }
    override func solve() -> Int {
        return lhs % rhs
    }
}
