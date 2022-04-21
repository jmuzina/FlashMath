//
//  Model.swift
//  FlashMath
//
//  Created by J. Muzina on 4/21/22.
//

import Foundation

class Model {
    init() {
        instance()
    }
    
    func instance() -> Model {
        if (singleton == nil) {
            singleton = Model()
        }
        return singleton!
    }
    
    var hello: Int = 0
    //static var singleton:Model? = nil
}

var singleton: Model?
