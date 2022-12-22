//: [Previous](@previous)

import Foundation

func trappingRainWaterBruteForce(_ height: [Int]) -> Int {
    var maximumLeft = 0
    var maximumRight = 0
    var water = 0

    for (index,item) in height.enumerated() {
        maximumLeft = item > maximumLeft ? item : maximumLeft
        
        for item in height[index...] {
            maximumRight = item > maximumRight ? item : maximumRight
        }
        
        let minHeight = min(maximumLeft, maximumRight)
        water += minHeight - item
        maximumRight = 0
    }

    return water
}

let container = [0,1,0,2,1,0,1,3,2,1,2,1]
trappingRainWaterBruteForce(container)
