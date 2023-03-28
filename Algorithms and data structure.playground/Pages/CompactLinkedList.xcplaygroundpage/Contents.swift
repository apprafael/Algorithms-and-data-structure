public class CompactNode<T> {
    var value: T
    var next: CompactNode<T>?
    
    init(value: T) {
        self.value = value
    }
}

public class CompactLinkedList<T> {
    private var head: CompactNode<T>?

    func append(value: T) {
        let newNode = CompactNode(value: value)
        guard let _ = head else {
            return head = newNode
        }
        var nextHead = head
        while(nextHead?.next != nil) {
            nextHead = nextHead?.next
        }
        nextHead?.next = newNode
    }
    
    func reverseList() {
        var prevNode:  CompactNode<T>?
        var nextNode: CompactNode<T>?

        while head != nil {
            nextNode = head?.next
            head?.next = prevNode
            prevNode = head
            head = nextNode
        }

        head = prevNode
    }
}

extension CompactLinkedList: CustomStringConvertible {
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

let carBrands = CompactLinkedList<String>()
carBrands.append(value: "BMW")
carBrands.append(value: "Ferrari")
carBrands.append(value: "Audi")
carBrands.append(value: "Fiat")
carBrands.append(value: "Chevrolet")
carBrands.append(value: "Mercedes")
print(carBrands)
carBrands.reverseList()
print(carBrands)
