//: [Previous](@previous)

import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    for (index, num1) in nums.enumerated() {
        for index2 in index+1...nums.count - 1 {
            if num1 + nums[index2] == target {
                return [index, index2]
            }
        }
    }
    return []
}

print(twoSum([3,2,4], 6))
