import Foundation

func minRemoveToMakeValid(_ s: String) -> String {
    var stack = [(Int, Character)]()
    var result = String()
    
    s.enumerated().forEach { index, char in
        if char == ")" && stack.last?.1 == "(" {
            stack.removeLast()
        } else if char == ")" || char == "(" {
            stack.append((index,char))
        }
    }
    
    s.enumerated().forEach { index, char in
        if (stack.first(where: { $0.0 == index }) == nil) && (char != ")" || char != "(") {
            result.append(char)
        }
    }

    return result
}

print(minRemoveToMakeValid("lee(t(c)o)de)"))
print(minRemoveToMakeValid("a)b(c)d"))
print(minRemoveToMakeValid("))(("))
