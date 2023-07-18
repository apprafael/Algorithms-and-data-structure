//: [Previous](@previous)

import Foundation

func searchRange(_ nums: [Int], _ target: Int) -> Int {
    var leftPointer = 0
    var rightPointer = nums.count
    
    while leftPointer <= rightPointer {
        let half = (leftPointer+rightPointer)/2
        let foundValue = nums[half]
        
        if foundValue == target {
            return half
        } else if foundValue < target {
            leftPointer = half + 1
        } else {
            rightPointer = half - 1
        }
    }
    return -1
}

print(searchRange([1,4,6,8,9], 6))
