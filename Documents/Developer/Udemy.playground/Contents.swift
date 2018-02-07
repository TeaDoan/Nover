//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
func personBIM(personWeight:Double, personHeight:Double) -> Double {
    var personWeightByKg = personWeight/2.2
    var personHeightByMeter = personHeight/3.3048
    var resultBIM = personWeightByKg/(personHeightByMeter * personHeightByMeter)
    
    return resultBIM
}
personBIM(personWeight: 118.0, personHeight: 5.4)


