import Foundation

func validParentheses(_ s: String) -> Bool {
    var parentheses = [Character]()
    var parenthesesDict: [Character: Character] = ["]":"[",
                                                   "}":"{",
                                                   ")":"("]
    
    s.forEach { char in
        if let parentethese =  parenthesesDict[char], parentethese == parentheses.last {
            parentheses.removeLast()
        } else {
            parentheses.append(char)
        }
    }
    
    return parentheses.isEmpty
}

print(validParentheses("{})"))
print(validParentheses("{}{}{}{}{}{}{}{}{}"))
print(validParentheses("{}{(}{}{}{}{}{}{}{}"))
print(validParentheses("{[]}()"))
print(validParentheses("{[()()]}()"))
print(validParentheses("{[()(){]}()"))

