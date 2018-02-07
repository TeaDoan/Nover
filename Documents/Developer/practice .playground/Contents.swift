//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let arrayNumbers = [1,2,3,4,5,6]
var sum = 0
for number in arrayNumbers {
    sum += number
    
    
}

func numberName(for count: Int) -> String {
    return (count == 0) ? "no more" : "\(count)"
}

func pluralize(string: String, for count: Int) -> String {
    if count == 0 {
        return "no more" + string + "s"
    }
    return string + ((count == 1) ? "" : "s")
}

func line(for count: Int) -> String {
    return """
    \(numberName(for: count)) \(pluralize(string: "bottle", for: count)) of beer on the wall,
    \(numberName(for: count)) \(pluralize(string: "bottle", for: count)) of beer,
    take one down, pass it around,
    \(numberName(for: count - 1)) \(pluralize(string: "bottle", for: count)) of beer on the wall
    
    """
}

func refactoredBeerSong() -> String {
    var song = ""
    for num in (1...99).reversed() {
        song += line(for: num)
    }
    
    return song + """
    Go to the store and buy some more, 99 bottles of beer on the wall.
    """
}

func beerSong() -> String {
    var lyric: String = ""
    for number in (3...99).reversed() {
        let newLine:String = "\n\(number) bottles of beer on the wall,\(number) bottles of beer.\nTake one down and pass it around, \(number - 1) bottles of beer on the wall."
        lyric += newLine
    }
    
    
    lyric += """
    2 bottles of beer on the wall, 2 bottles of beer. Take one down and pass it around,
    1 bottle of beer on the wall.1 bottle of beer on the wall, 1 bottle of beer.'
    Take one down and pass it around, no more bottles of beer on the wall.
    No more bottles of beer on the wall, no more bottles of beer.
    Go to the store and buy some more, 99 bottles of beer on the wall.
    """
    
    return lyric
}

//beerSong()
//print(beerSong())

print(refactoredBeerSong())

func fibonacci(until n:Int) {
    var num1 = 0
    var num2 = 1
    print(num1)
    print(num2)
    for _ in 0...n {
        let num = num1 + num2
        print(num)
        num1 = num2
        num2 = num
    }
    
}
 fibonacci(until: 5)
