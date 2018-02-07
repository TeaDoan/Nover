//
//  main.swift
//  Classes and Objects
//
//  Created by Thao Doan on 12/2/17.
//  Copyright © 2017 Thao Doan. All rights reserved.
//

import Foundation

let myCar = Car()
let otherCar = Car(customerChosenColour: "pink", customerChoseCartype:.Couple)
//print (myCar.carColour)
////
//myCar.carColor = "Red"
//print(myCar.carColor)
//
//print(otherCar.typeOffCar)
//print(myCar.carColour)

otherCar.drive()
let thaoNewCar = SelfDriveCare()

thaoNewCar.drive()
print(thaoNewCar.carColour)
thaoNewCar.drive()
thaoNewCar.destination = "New York "
print(thaoNewCar.drive())








