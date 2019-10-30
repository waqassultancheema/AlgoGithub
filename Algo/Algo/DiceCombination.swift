//
//  DiceCombination.swift
//  Algo
//
//  Created by Waqas Sultan on 2/13/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit

class DiceCombination {

    func diseCombination(coins:[Int],diceKinds:Int,sum:Int) ->Int  {
        
        var dp:[[Int]] = Array<[Int]>()
        
        for _ in 0..<diceKinds + 1 {
            var array = Array<Int>()
            for _ in 0..<sum + 1 {
                array.append(0)
            }
            dp.append(array)
        }
        
        for index in 0..<diceKinds + 1 {
            dp[index][0] = 1
        }
        
        for index in 1..<diceKinds + 1 {
            for indexSecond in 1..<sum + 1 {
                dp[index][indexSecond] = 0
            
                let value =   (indexSecond / coins[index-1]) + 1
                
                for k in 0..<value {
                    let second = indexSecond - k * coins[index-1]
                    dp[index][indexSecond] =  dp[index][indexSecond] + dp[index-1][second];

                }
            }
        }
        return dp[diceKinds][sum]
    }
}




