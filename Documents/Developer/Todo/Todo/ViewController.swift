//
//  ViewController.swift
//  Todo
//
//  Created by Thao Doan on 12/25/17.
//  Copyright © 2017 Thao Doan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var taskTapped: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func searchButtonTapped(_ sender: UIButton) {
        
        taskTapped.forEach{(button) in
            UIView.animate(withDuration: 0.1, animations: {button.isHidden = !button.isHidden})
            self.view.layoutIfNeeded()
        }
        
    }
    
    @IBAction func taskButtonSelected(_ sender: UIButton) {
    }
    
    
    
    
}

