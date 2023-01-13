//: [Previous](@previous)

import Foundation

func lengthOfLongestSubstring(_ s: String) -> Int {
    var response = String()
    var responseList = [String]()
    for (index,char) in s.enumerated() {
        if !response.contains(char) {
            response.append(char)
            if s.count == index + 1 {
                responseList.append(response)
            }
        } else {
            if !response.isEmpty {
                responseList.append(response)
                response = response.components(separatedBy: CharacterSet(charactersIn: String(char))).last ?? String()
                response.append(char)
            }
        }
    }
    return responseList.map { $0.count }.sorted().last ?? 0
}

print(lengthOfLongestSubstring("pwwkew"))

