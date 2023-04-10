public class Node<T: Equatable> {
    var value: T
    var next: Node<T>?
    var previous: Node<T>?
    
    init(value: T) {
        self.value = value
    }
}

public class LinkedList<T: Equatable> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    func reverseList() {
        tail = head
        var oldHead = head
        head = nil

        while(tail != nil) {
            let nextHead = tail?.next
            tail?.next = head
            head = tail
            tail = nextHead
        }
        
        tail = oldHead
    }
    
    func reverseList(rangeM: T, rangeN: T) {
        var oldHead = head
        var oldTail = tail
        
        var initialMergeLink: Node<T>? = nil
        var finalMergeLink: Node<T>? = nil
        
        var previousInitialMergeLink: Node<T>? = nil
        var nextFinalMergeLink: Node<T>? = nil
        
        var tempHead = head
        
        while(tempHead?.next != nil) {
            if initialMergeLink == nil && tempHead?.value == rangeM {
                initialMergeLink = tempHead
            }
            
            if initialMergeLink == nil {
                previousInitialMergeLink = tempHead
            }
            
            if finalMergeLink == nil && tempHead?.value == rangeN {
                finalMergeLink = tempHead
                nextFinalMergeLink = tempHead?.next
            }
            
            tempHead = tempHead?.next
        }
        finalMergeLink?.next = nil
        
        head = initialMergeLink
        tail = finalMergeLink
        
        reverseList()
        
        previousInitialMergeLink?.next = head
        head = oldHead

        tail?.next = nextFinalMergeLink
        tail = oldTail
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
carBrands.reverseList(rangeM: "Ferrari", rangeN: "Chevrolet")
print(carBrands)
