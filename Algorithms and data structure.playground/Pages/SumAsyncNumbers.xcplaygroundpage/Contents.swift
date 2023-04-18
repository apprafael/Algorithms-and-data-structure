import Foundation

func function1() -> Int {
    print("Function 1 starting...")
    sleep(2) // Simulate some work
    print("Function 1 completed.")
    return 42
}

func function2() -> Int {
    print("Function 2 starting...")
    sleep(1) // Simulate some work
    print("Function 2 completed.")
    return 17
}

let queue = DispatchQueue(label: "com.example.myqueue", attributes: .concurrent)
let group = DispatchGroup()

var result1: Int = 0
var result2: Int = 0

queue.async(group: group) {
    result1 = function1()
    print("Result 1: \(result1)")
}

queue.async(group: group) {
    result2 = function2()
    print("Result 2: \(result2)")
}

group.wait() // Wait for both tasks to complete

let total = result1 + result2
print("Total: \(total)")
