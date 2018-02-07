//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func beerSong(lowerNumberOfBeers: Int, greaterNumberOfBeer:Int) -> String {
    
    var lyric:String = ""
    
    
   for numberOfBeer in (lowerNumberOfBeers...greaterNumberOfBeer).reversed() {
    
        var newline : String = "\n \(numberOfBeer) bottles of beer on the wall,\(numberOfBeer)  bottles of beer.\nTake one down and pass it around,\(numberOfBeer - lowerNumberOfBeers) bottles of beer on the wall."
    
            lyric += newline  }
  
           lyric += "\nNo more bottles of beer on the wall, no more bottles of beer.Go to the store and buy some more, 99 bottles of beer on the wall."
    return  lyric
}
    





print(beerSong(lowerNumberOfBeers: 1, greaterNumberOfBeer: 99))
var sum = 0
for number in (1...3).reversed() {
    sum = 20 + number
    
    
    print(sum)
    
}







