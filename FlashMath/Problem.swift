//
//  Problem.swift
//  FlashMath
//
//  Created by Parker Fisher on 4/21/22.
//

import Foundation

class Problem {
    
    init(maxInt: Int) {
        lhs = Int.random(in: 0...maxInt)
        rhs = Int.random(in: 0...maxInt)
    }
    
    func solve () -> Int {
        return 0
    }
    
    var lhs : Int = 0
    var rhs : Int = 0
}

class AdditionProblem : Problem {
    override init(maxInt: Int) {
        super.init(maxInt: maxInt)
    }
    override func solve() -> Int {
        return lhs + rhs
    }
}

class SubtractionProblem : Problem {
    override init(maxInt: Int) {
        super.init(maxInt: maxInt)
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
    override init(maxInt: Int) {
        super.init(maxInt: maxInt)
    }
    override func solve() -> Int {
        return lhs * rhs
    }
}

class DivisionProblem : Problem {
    override init(maxInt: Int) {
        super.init(maxInt: maxInt)
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
    override init(maxInt: Int) {
        super.init(maxInt: maxInt)
        lhs = Int.random(in: 0...12)
        rhs = Int.random(in: 1...12)
    }
    override func solve() -> Int {
        return lhs % rhs
    }
}
