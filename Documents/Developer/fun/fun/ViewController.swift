//
//  ViewController.swift
//  fun
//
//  Created by Thao Doan on 1/18/18.
//  Copyright © 2018 Thao Doan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    
    @IBOutlet weak var resultTextView: UITextView!
    
    @IBOutlet weak var yourNameTextField: UITextField!
    @IBOutlet weak var theirNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func resultButtonPressed(_ sender: Any) {
     updateResult()
        
    }
    func updateResult() {
    
        
        
        let result = String(arc4random_uniform(101))
        
             resultTextView.text = result
        
        if result > "80" && yourNameTextField != nil && theirNameTextField != nil  {
            resultTextView.text = "Your love score is \(result) Congrat! Your love is perfect"
           
        }
            
        else if result > "50" && result <= "80" && yourNameTextField != nil && theirNameTextField != nil {
            
            resultTextView.text = "Your love score is \(result) You guys make a great couple"
            
        }
        else {
            
            resultTextView.text = "Your love score is \(result) Your love requied lot of work"
            
        }
            
        
}
    @IBAction func starOverButton(_ sender: Any) {
        
        resultTextView.text = ""
        yourNameTextField.text = ""
        theirNameTextField.text = ""
        
    }
}
        
       
            
    


