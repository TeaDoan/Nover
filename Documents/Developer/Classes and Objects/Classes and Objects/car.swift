//
//  car.swift
//  Classes and Objects
//
//  Created by Thao Doan on 12/2/17.
//  Copyright © 2017 Thao Doan. All rights reserved.
//

import Foundation
enum Cartype {
    case Couple
    case Sedan
    case Hatchback
}
class Car {
    var carColour = "Black"
    let carSeat = 5
    var typeOfCar: Cartype = .Couple
    init() {
    }
    convenience init(customerChosenColour: String, customerChoseCartype:Cartype){
    self.init()
    carColour = customerChosenColour
        typeOfCar = customerChoseCartype
    
    }
    func drive() {
        print("Car is moving")
    }
    
}
