//: [Previous](@previous)

import Foundation

func isAlmosPalindrome(text: String) -> Bool {
    for index in 0..<text.count {
        var text = String(text.lowercased().unicodeScalars.filter(CharacterSet.letters.contains))
        let substringIndex = text.index(text.startIndex, offsetBy: index)
        text.remove(at: substringIndex)
        print("\(text) * \(String(text.reversed()))")
        if text == String(text.reversed()) {
            return true
        }
    }
    return false
}

isAlmosPalindrome(text: "Race a car")
