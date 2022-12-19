import Foundation

func getMaxWaterContainer(container: [Int]) -> Int {
    var index1 = 0
    var index2 = container.count - 1
    var maxWater = 0
    
    while index2 > index1 {
        let minimumHeight = min(container[index1], container[index2])
        let containerWidth = index2 - index1
        let maxWaterMath = minimumHeight * containerWidth
        maxWater = maxWaterMath > maxWater ? maxWaterMath : maxWater
        index1 = minimumHeight == container[index1] ? index1 + 1 : index1
        index2 = minimumHeight == container[index2] ? index2 - 1 : index2
    }
    
    return maxWater
}

let container = [4,8,1,2,3,9]

getMaxWaterContainer(container: container)
