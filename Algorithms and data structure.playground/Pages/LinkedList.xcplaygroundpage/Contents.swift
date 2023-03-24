public class Node<T> {
    var value: T
    var next: Node<T>?
    var previous: Node<T>?
    
    init(value: T) {
        self.value = value
    }
}

public class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    func reverseList() {
        tail = head
        head = nil
        
        while(tail != nil) {
            let nextHead = tail?.next
            tail?.next = head
            head = tail
            tail = nextHead
        }
    }

    func append(value: T) {
        let newNode = Node(value: value)
        if let _ = tail {
            tail?.next = newNode
            tail?.previous = tail
            tail = newNode
        } else {
            head = newNode
            tail?.previous = head
            tail = head
        }
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        var text = "["
        var node = head
        
        while node != nil {
            text += "\(node!.value)"
            node = node!.next
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
carBrands.reverseList()
print(carBrands)
