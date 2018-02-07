//
//  ViewController.swift
//  DRec
//
//  Created by Thao Doan on 12/12/17.
//  Copyright © 2017 Thao Doan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func buttonPressed(_ sender: Any) {
        performSegue(withIdentifier: "goSecondViewControler", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goSecondViewControler"{
        let destinationVC = segue.destination as! SecondViewController
        destinationVC.textPassOver = textField.text!
    }
}

}
