//: [Previous](@previous)
import Foundation

func backspaceCompare(_ s: String, _ t: String) -> Bool {
    doBackSpace(s) == doBackSpace(t)
}

func doBackSpace(_ text: String) -> String {
    var text = text
    for (index, value) in text.enumerated() {
        if value == "#" {
            let stringIndex = text.index(text.startIndex, offsetBy: index)
            text.remove(at: stringIndex)
            
            if index > 0 {
                let stringIndex = text.index(text.startIndex, offsetBy: index - 1)
                text.remove(at: stringIndex)
            }
            text = doBackSpace(text)
            break
        }
    }
    return text
}

let s = "ab##", t = "c#d#"
print(backspaceCompare(s,t))
