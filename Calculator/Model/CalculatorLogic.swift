//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Abraham Wachsman on 7/9/20.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    /* Originally, number was a Double rather than a Double?, since CalculatorLogic was a class and needed an initializer;  having moved to a struct obviates that.  We also moved the line "private let calculator = CalculatorLogic()" in ViewController out of IBAction, made it global and removed displayValue as a param.  This allows for its value is nil, so we changed number from Double to Double? . We also made it private
     
     */
    private var number: Double?
    
    // Create a function that allows other classes to set the value of the number property
    mutating func setNumber(_ number: Double) {
        self.number = number  // set the value of the private var named number to the value of the param passed in (also called number)
    }
    
    /* Initialize number - Obsolete:  Need an initializer if we're declaring a class but we're now using a struct which provides its own initializer; thus, code below is commented out.
     
     init(number: Double) {
         self.number = number  // This means that self.number (declared as the above global var named number gets its value from the local var nameed number when this class is initialized
     }*/
    
    // In function below, we return Double? rather than Double;  this is because at bottom of if statements, we return a nil; since Double does not allow nil, we need to declare it as Double?
    
    func calculate(symbol: String?) -> Double? {
        // Process calculation buttons (AC, +/-, %)
        /* This code has been moved from ViewController.swift but sender, displayValue and displayLabel don't exist in this file. So, sender was replaced by symbol, dispValue was replaced by number, return statements send values to populate displayLabel.  Subsequently, number was changed to an optional to allow a nil value.  That required the if let n = number statement; number was replaced by n in return statements */
        
        if let n = number {
            if symbol == "+/-" {
                return n * -1
                //return number * -1
                //displayValue = displayValue * -1
                
            } else if symbol == "AC" {
                return 0
                //displayLabel.text = "0"
            } else if symbol == "%" {
                return n * 0.01
                //return number * 0.01
                //displayValue = displayValue * 0.01
            } else if symbol == "+" {
                
            } else if symbol == "=" {
                
            }
        }
        // Since the value of symbol may be other than one handled by the if statement, we need to return something to cover that so we return a nil here
        return nil
    }
}
