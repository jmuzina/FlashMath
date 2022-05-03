//
//  answerEntry.swift
//  FlashMath
//
//  Created by J. Muzina on 5/3/22.
//

import UIKit

class answerEntry: UITextField {
    // Disable pasting into the text entry field
    // CREDIT: https://stackoverflow.com/a/29596354
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.paste(_:)) {
            return false
        }
        return super.canPerformAction(action, withSender: sender)
   }
}
