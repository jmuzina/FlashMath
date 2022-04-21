//
//  GameManager.swift
//  FlashMath
//
//  Created by J. Muzina on 4/21/22.
//

import UIKit

class GameManager: NSObject {
    private var items = [Item]()
    func addItem(matches : Int) {
        let item = Item(score:matches)
        items.append(item)

        items.sort{
            return $0.score >= $1.score
        }
    }
    func getItem(index : Int) -> Item {
        return items[index]
    }
    func setItem(_ item: Item, number index: Int) {
        items[index] = item
    }
    func removeItem(at index : Int) {
        items.remove(at: index)
    }
    func itemsCount() -> Int {
        return items.count
    }
}

