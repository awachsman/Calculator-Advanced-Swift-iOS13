//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    // Create a var to track if user has finished typing a number;  var is private - private poperties and methods are only accessible within the braces in which they're declared, ensuring it's not inadveretently modified.
    private var isFinishedTypingNumber: Bool = true
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        // Reset isFinishedTypingNumber back to true
        
        isFinishedTypingNumber = true
        
        // Expand operational functionality (AC, +/-. %)
        // Convert displayLabel.text's current value to double.  NOTE: It converts to optional double since text might not be a number. If we nil coalesce it (i.e."let number = Double(displayLabel.text!) ?? 0" which means "convert displayLabel.text to a double and assign result to number; if that fails, set number to 0".) it may present difficulties when debugging so use guard instead.
        
        
        guard let number = Double(displayLabel.text!) else {
            fatalError("Cannot convert displayLabel.text to a Double.")
        }
        
        // Process calculation buttons (AC, +/-, %)
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                displayLabel.text = String(number * -1)
            } else if calcMethod == "AC" {
                displayLabel.text = "0"
            } else if calcMethod == "%" {
                displayLabel.text = String(number * 0.01)
            }
        }
    
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        // Check for nil value in sender.currentTitle
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                // Control for instance where the user entered "." but displayLabel.text already contains a "."
                
                if numValue == "." {
                    
                    // Create a constant which holds the current value of displayLabel.text; if that fails, present a fata error
                    guard let currentDisplayValue = Double(displayLabel.text!) else {
                        fatalError("Cannot convert displayLabel.text to a Double.")
                    }
                    //Compare the rounded down value (using floor) of currentDisplayValue to the unrounded value of currentDisplayValue and assign to the boolean isInt
                    let isInt = floor(currentDisplayValue) == currentDisplayValue
                    
                    // Check Int; if it's false, simply return at this point, preventing addition of another "."
                    
                    if !isInt {
                        return
                    }
                    
                    let string = displayLabel.text!
                      // check if displayLabel.text already contains a "."
                    let decimalAlreadyExists = string.contains(numValue)
                    if decimalAlreadyExists {
                        return
                    }
                    
                }
                displayLabel.text! += numValue
            }
        }
    
    }

}

