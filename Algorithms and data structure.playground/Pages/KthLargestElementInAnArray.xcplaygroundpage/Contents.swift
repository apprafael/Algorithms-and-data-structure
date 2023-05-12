
import Foundation

func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    nums.sorted().suffix(k).first ?? 0
}

print(findKthLargest([3,2,1,5,6,4], 2))
