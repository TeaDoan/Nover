//
//  ViewController.swift
//  LoveMath
//
//  Created by Thao Doan on 12/15/17.
//  Copyright © 2017 Thao Doan. All rights reserved.
//

import UIKit

// creat  type of opertators
enum Opt: String {
    case plus = "+"
    case minus = "-"
    case divide = "/"
    case multiply = "X"
    case empty = ""
}

class ViewController: UIViewController {
    
    var previousNumber: Double? // prepresent for first digit is pressed
    var result = Double()
    var opt: Opt = .empty // to check in case user just press button without press any operator button
    
    func currentNumber() -> Double? {
        return Double(resultLabel.text!) // nil on launch (no buttons pressed)
    }

    @IBOutlet weak var userAnswerTextField: UITextField!
    
    
    
    @IBOutlet weak var resultLabel: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
       
        
       
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
       
    }
    @IBAction func equallyButtonPressed(_ sender: UIButton) {
        
        guard let prevNum = previousNumber else { return } // check if previous number is not nil
        
        // this func do the math after the "=" button is pressed.
        switch opt {
           
        case .plus:

            result = prevNum + currentNumber()!
            resultLabel.text! = "\(result)"
            
        case .minus:
            
           result =  prevNum - currentNumber()!
            resultLabel.text! = "\(result)"
            
        case .divide:
            
            result =  prevNum / currentNumber()!
            resultLabel.text! = "\(result)"
            
            
            
        case .multiply:
           
            result =  prevNum * currentNumber()!
            resultLabel.text! = "\(result)"
            
            
        case .empty:
            return resultLabel.text = ""
        }
        
        
        // result label will show
        // previous number (+-*÷) currentNumber
        
        
        
       
    }
    @IBAction func clearButton(_ sender: UIButton) {
        
        resultLabel.text = "" // when users press clear button it will  restart the label
        opt = Opt(rawValue: "")! // also we check if the operator is nil
        resultLabel.text = "0" // we want the label display number 0 on the current label
        
    }
    @IBAction func nagativeNumber(_ sender: UIButton) {
        
        resultLabel.text = String(0 - currentNumber()!)
     }

    
    @IBAction func percentButton(_ sender: UIButton) {
        resultLabel.text = String( currentNumber()!/100)
    }
    
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        
        opt = Opt(rawValue: sender.titleLabel!.text!)! // call the titleLabel of any particular button is pressed
        previousNumber = currentNumber() //  store previous number 
    }
    
    
    @IBAction func dotButtonPressed(_ sender: UIButton) {
        
       
    }
    
        
   
    @IBAction func numberPressed(_ sender: UIButton) {
       
        if opt == .empty { // building first number
            
            if currentNumber() == 0 { // first button tapped --> show on label
                
                resultLabel.text = String(sender.tag - 1)
                
            } else { // all other digits tapped --> update label
                
                addDigitToString(digit: sender.tag - 1)
            }
           
        } else { // operator has been chosen
            
            if (previousNumber! == currentNumber()) { // building second number (first digit)
                
                // number pressed -> show as first digit
                resultLabel.text = String(sender.tag - 1)
                
            } else { // building second number (all digits after first)
                
                // add number (as String) to end of label
                addDigitToString(digit: sender.tag - 1)
            }
            
            
        }

    }
    
    func addDigitToString(digit: Int) {
        resultLabel.text = resultLabel.text! + String(digit) // show digit is pressed
    }
}

    
            

       




       
            

        
        
        
        
        

    
    





