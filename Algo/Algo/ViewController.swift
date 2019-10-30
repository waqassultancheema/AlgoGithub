//
//  ViewController.swift
//  Algo
//
//  Created by Waqas Sultan on 11/19/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit

extension Dictionary where Value : Equatable {
    func allKeysForValue(val : Value) -> [Key] {
        return self.filter { $1 == val }.map { $0.0 }
    }
}

extension Int {
    var array: [Int] {
        return String(self).compactMap{ Int(String($0)) }
    }
}

extension StringProtocol {
    var ascii: [UInt32] {
        return compactMap { $0.ascii }
    }
}
extension Character {
    var isAscii: Bool {
        return unicodeScalars.allSatisfy { $0.isASCII }
    }
    var ascii: UInt32? {
        return isAscii ? unicodeScalars.first?.value : nil
    }
}

extension StringProtocol {
    subscript(bounds: CountableClosedRange<Int>) -> SubSequence {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(start, offsetBy: bounds.count)
        return self[start..<end]
    }
    
    subscript(bounds: CountableRange<Int>) -> SubSequence {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(start, offsetBy: bounds.count)
        return self[start..<end]
    }
}

struct BigInt {
    
    var value: String
    
    
    func add(right: BigInt) -> BigInt {
        var leftCharacterArray = value.reversed().map { Int(String($0))! }
        var rightCharacterArray = right.value.reversed().map { Int(String($0))! }
        var result = [Int](repeating: 0, count: leftCharacterArray.count+rightCharacterArray.count)
        
        let maxLengith = max(leftCharacterArray.count,rightCharacterArray.count)
      //  for leftIndex in 0..<leftCharacterArray.count {
            for rightIndex in 0..<maxLengith {
                
                let resultIndex =  rightIndex
                // i have changes this belwo add  sign..............this one
                result[resultIndex] = (leftCharacterArray.count > resultIndex ? leftCharacterArray[rightIndex]  : 0)  + (rightCharacterArray.count > resultIndex ? rightCharacterArray[rightIndex]  : 0) + (resultIndex >= result.count ? 0 : result[resultIndex])
                if result[resultIndex] > 9 {
                    result[resultIndex + 1] = (result[resultIndex] / 10) + (resultIndex+1 >= result.count ? 0 : result[resultIndex + 1])
                    result[resultIndex] -= (result[resultIndex] / 10) * 10
                } else {
                   // break
                }
                
            }
            
      //  }
        
        result = Array(result.reversed())
        var nonZeroValue = false
        result = result.filter({ (value) -> Bool in
            if value != 0 {
                nonZeroValue = true
                return true
            } else if value == 0 && nonZeroValue == false {
                return false
            }
            return true
            
        })
        return  BigInt(value: result.map { String($0) }.joined(separator: ""))
    }
    
    
    
    func compareTwoBigInt(right:BigInt) -> Bool {
        var leftCharacterArray = value.map { Int(String($0))! }
        var rightCharacterArray = right.value.map { Int(String($0))! }
        
        
        if leftCharacterArray.count != leftCharacterArray.count {
            return false
        } else {
            let maxLengith = max(leftCharacterArray.count,rightCharacterArray.count)
            //  for leftIndex in 0..<leftCharacterArray.count {
            for rightIndex in 0..<maxLengith {
                
                let resultIndex =  rightIndex
                // i have changes this belwo add  sign..............this one
                if ((leftCharacterArray.count > resultIndex ? leftCharacterArray[rightIndex]  : 0)  !=  (rightCharacterArray.count > resultIndex ?rightCharacterArray[rightIndex]  : 0)  ) {
                    return false
                }
               
                
            }
        }
        
        
        return true
    }
    
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let g = Answer()
//        g.getAnswer()
//        let tree = BinaryTree<String>()
//
//        tree.insert(element: "F")
//        tree.insert(element: "G")
//        tree.insert(element: "H")
//        tree.insert(element: "D")
//        tree.insert(element: "E")
//        tree.insert(element: "I")
//        tree.insert(element: "J")
//        tree.insert(element: "A")
//        tree.insert(element: "B")
//        tree.insert(element: "C")
        
        let dice = DiceCombination()
        let coins = [1, 2, 3, 4, 5, 6]
        let sum = 10;
        let result = dice.diseCombination(coins: coins, diceKinds: 6, sum: sum)
        print("REsult are \(result)")
        // Do any additional setup after loading the view, typically from a nib.
    }


}

