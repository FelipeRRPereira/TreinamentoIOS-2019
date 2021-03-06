//
//  ViewController.swift
//  Calculadora
//
//  Created by treinamento on 26/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    lazy var calculator = Calculator()
    
    @IBOutlet weak var DisplayLabel: UILabel!
    @IBOutlet var numbersButtons: [UIButton]!
    
    var numbers = ""
    var result = ""
    var number1 = 0
    var number2 = 0
    var operation = ""
    
    @IBAction func touchButton(_ sender: UIButton) {
        switch sender.tag {
        case 0...9:
            numbers += String(sender.tag)
            if operation.isEmpty {
                DisplayLabel.text? = numbers
                number1 = Int(numbers) ?? 0
            } else {
                DisplayLabel.text? = "\(number1) \(operation) \(numbers)"
                number2 = Int(numbers) ?? 0
            }
        case 10:
            result = calculator.xSquared(number: number1)
            DisplayLabel.text? = "\(number1)²"
        case 11:
            result = calculator.squareRoot(number: number1)
            DisplayLabel.text? = "√\(number1)"
        case 12...15:
            operation = String(describing: sender.titleLabel!.text!)
            DisplayLabel.text? = "\(number1) \(operation)"
            numbers = ""
        case 16:
            if !operation.isEmpty {
                result = calculator.operations(operation: operation, number1: number1, number2: number2)
            }
            DisplayLabel.text? = "Result: \(result)"
            number1 = Int(result) ?? 0
            number2 = 0
            numbers = String(number1)
            operation = ""
        default:
            clear()
        }
        
    }
    
    func clear() {
        DisplayLabel.text? = "0"
        number1 = 0
        number2 = 0
        operation = ""
        result = ""
        numbers = ""
    }
}

