//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Abraham Wachsman on 7/9/20.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    var number: Double  // Since we're leaving this as a Double rather than a Double?, we need an initializer
    
    //Initialize number
    init(number: Double) {
        self.number = number  // This means that self.number (declared as the above global var named number gets its value from the local var nameed number when this class is initialized
    }
    
    // In function below, we return Double? rather than Double;  this is because at bottom of if statements, we return a nil; since Double does not allow nil, we need to declare it as Doulbe?
    func calculate(symbol: String?) -> Double? {
    // Process calculation buttons (AC, +/-, %)
    // NOTE: This code was moved from ViewController.swift which originally referenced sender, displayValue and displayLabel, which don't exist in this file. Therefore, 1) sender has been replaced with symbol; dispValue has been replaced with number 3) return statements send values to populate displaLLabel
        if symbol == "+/-" {
            return number * -1
            //displayValue = displayValue * -1
            
        } else if symbol == "AC" {
            return 0
            //displayLabel.text = "0"
        } else if symbol == "%" {
            return number * 0.01
            //displayValue = displayValue * 0.01
        }
        // Since there is a possibility that the value of symbol is other than one handled by the if statement; therefore, we need to return something to cover that so we return a nil here
        return nil
    }
}
