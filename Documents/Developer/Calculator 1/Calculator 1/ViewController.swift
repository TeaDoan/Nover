//
//  ViewController.swift
//  Calculator 1
//
//  Created by Thao Doan on 12/15/17.
//  Copyright © 2017 Thao Doan. All rights reserved.
//

import UIKit

    
enum Opt: String {
    case plus = "+"
    case minus = "-"
    case divide = "/"
    case multiply = "X"
    case empty = ""
}
class ViewController: UIViewController {
    
    var digitPressed : Double?
    var currentDigit : Double?
    var result = Double()
    var opt:Opt = .empty
    
    
    

   
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func restartDisplayLabel(_ sender: UIButton)
    {
       
        opt = Opt(rawValue: "")!
        displayLabel.text = "0"
       
        
    }
    
    @IBAction func performingMath(_ sender: UIButton) {
     
      
        currentDigit =  Double(displayLabel.text!)!
        
        guard let firstNum = digitPressed else { return}

        guard let secondNum = currentDigit else { return}

        
        
        switch opt  {
            
        
           
        case .plus:
            result = firstNum + secondNum
            displayLabel.text = "\(result)"
        case .minus:
            
            result = firstNum - secondNum
            displayLabel.text = "\(result)"
            
        case .multiply:
            
            result = firstNum * secondNum
            displayLabel.text = "\(result)"
            
        case .divide:
           result = firstNum / secondNum
            displayLabel.text = "\(result)"
            
        case .empty:
            displayLabel.text = "0"
        }
       
        
    }
    

    @IBAction func operatorPressed(_ sender: UIButton){
        
        opt = Opt(rawValue: (sender.titleLabel?.text)!)!
        digitPressed = Double(displayLabel.text!)!
       
        
        
        
        
        
    }
        
        
    @IBAction func nagativeNumberPressed(_ sender: UIButton) {
        
    }
    
        
        
        
        
        
        
        
       
    
    @IBAction func numberPressed(_ sender: UIButton) {
        
        if opt == .empty {
            if displayLabel.text == "0" {
            
            displayLabel.text = sender.titleLabel?.text!
            
        }
        else {
            
            displayLabel.text = displayLabel.text! + (sender.titleLabel?.text!)!
            } }
        else {
            if digitPressed != nil {
                displayLabel.text =  (sender.titleLabel?.text!)!
                currentDigit = Double(displayLabel.text!)
                
            }
            else {
                if currentDigit != nil && digitPressed != nil  {
//                 displayLabel.text = displayLabel.text! + (sender.titleLabel?.text!)!
//                    displayLabel.text = sender.titleLabel?.text!
                displayLabel.text = displayLabel.text! + (sender.titleLabel?.text!)!
                currentDigit = Double(displayLabel.text!)
                    
                
                }
        }
       
        }
       
            
        }
}


        
        
        


        
    


        





                


        

    

       

        
        
            
            
       
        



