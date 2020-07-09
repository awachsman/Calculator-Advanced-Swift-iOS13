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
    
    // Create a computed var with a getter and a setter; gtter 'gets' the current value of displayLabel.text
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert displayLabel.text to a Double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        // Reset isFinishedTypingNumber back to true
        
        isFinishedTypingNumber = true
        
        // Expand operational functionality (AC, +/-. %)
        
        /* Originally, converted displayLabel.text's current value to double here. Could not use nil coalesce (i.e."let number = Double(displayLabel.text!) ?? 0" which means "convert displayLabel.text to a double and assign result to number; if that fails, set number to 0".) since it complicates debugging.  Used guard instead.  However, that functionality has been moved to the provate computed var named displayValue
         
         guard let number = Double(displayLabel.text!) else {
           fatalError("Cannot convert displayLabel.text to a Double.")
         }
         */
        
       
        // Process calculation buttons (AC, +/-, %)
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                //OLD - displayLabel.text = String(displayValue * -1);  replaced by computed property displayValue
                displayValue = displayValue * -1

            } else if calcMethod == "AC" {
                displayLabel.text = "0"
            } else if calcMethod == "%" {
                //OLD - displayLabel.text = String(displayValue * 0.01);  replaced by computed property displayValue
                displayValue = displayValue * 0.01
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
                    
                    /* Originally, we created a constantnamed currentDisplayValue which holds the value of displayLabel.text; if that failed, we present a fata error.  However, we moved that functionality to the computed var displayValue
                    
                     guard let currentDisplayValue = Double(displayLabel.text!) else {
                        fatalError("Cannot convert displayLabel.text to a Double.")
                    }
                     
                     */
                    //
                    //Compare the rounded down value (using floor) of currentDisplayValue to the unrounded value of currentDisplayValue and assign to the boolean isInt
                    let isInt = floor(displayValue) == displayValue
                    
                    // Check Int; if it's false, simply return at this point, preventing addition of another "."
                    
                    if !isInt {
                        return
                    }
                    
                    // Check if displayLabel.text already contains a "."  NOTE: This is not documented in video but is added to handle conditions not described there.
                    let string = displayLabel.text!
                      
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

