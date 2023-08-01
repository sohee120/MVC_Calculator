//
//  ViewController.swift
//  MVC Calculator
//
//  Created by 윤소희 on 2023/07/09.
//

import UIKit

class ViewController: UIViewController {
    
    private var userIsInTheMiddleOfTyping: Bool = false
    
    @IBOutlet private weak var displayLabel: UILabel!
    
    @IBAction private func touchDigit(sender: UIButton) {
        let digit = sender.titleLabel!.text!
        if userIsInTheMiddleOfTyping {
            let textCurrentlyDisplay = displayLabel.text!
            displayLabel.text = textCurrentlyDisplay + digit
        } else {
            displayLabel.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }
    
    private var displayValue: Double {
        get{
            return Double(displayLabel.text!)!
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    
    private var brain: CalculatorBrain = CalculatorBrain()
    
    @IBAction private func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(operand: displayValue)
            userIsInTheMiddleOfTyping = false
        }
        if let mathmaticalSymbol = sender.titleLabel!.text {
            brain.performOperation(symbol: mathmaticalSymbol)
        }
        displayValue = brain.result
    }
    
}

  
