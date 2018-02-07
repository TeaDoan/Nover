//
//  selfDriveCar.swift
//  Classes and Objects
//
//  Created by Thao Doan on 12/3/17.
//  Copyright © 2017 Thao Doan. All rights reserved.
//

import Foundation
class SelfDriveCare :Car {
    var destination:String?
    override func drive() {
        super.drive()
        if let customerDestination = destination {
            
            print("driving toward" + customerDestination)}
        
    
    }
   

}
