public class Node<T> {
    var value: T
    var previous: Node<T>?
    
    init(value: T) {
        self.value = value
    }
}

public class LinkedList<T> {
    private var tail: Node<T>?
    
    public func append(value: T) {
        let newNode = Node(value: value)
        if let _ = tail {
            newNode.previous = tail
            tail = newNode
        } else {
            tail = newNode
        }
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        var text = "["
        var node = tail
        
        while node != nil {
            text += "\(node!.value)"
            node = node!.previous
            if node != nil { text += ", " }
        }
        return text + "]"
    }
}

let carBrands = LinkedList<String>()
carBrands.append(value: "BMW")
carBrands.append(value: "Ferrari")
carBrands.append(value: "Audi")
carBrands.append(value: "Fiat")
carBrands.append(value: "Chevrolet")
carBrands.append(value: "Mercedes")
print(carBrands)
