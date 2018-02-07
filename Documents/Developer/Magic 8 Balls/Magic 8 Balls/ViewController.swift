//
//  ViewController.swift
//  Magic 8 Balls
//
//  Created by Thao Doan on 11/7/17.
//  Copyright © 2017 Thao Doan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
  
    
    var randomBallIndex1: Int = 0
    let ballArray = ["ball1", "ball2","ball3","ball4","ball5"]
    
    
    @IBOutlet weak var ballImageView1: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        upgradeBalls()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func askButtonPressed(_ sender: UIButton) {
        upgradeBalls()
        
    }
    func upgradeBalls() {
        randomBallIndex1 = Int(arc4random_uniform(5))
        ballImageView1.image = UIImage(named:ballArray[randomBallIndex1])
        
        }
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        upgradeBalls()
    }
    
    }

