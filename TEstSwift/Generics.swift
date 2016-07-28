//
//  Generics.swift
//  TEstSwift
//
//  Created by DONLINKS on 16/7/27.
//  Copyright © 2016年 Minstone. All rights reserved.
//

/**
 泛型
 */
import Foundation

func generics() {
    
    var value1 = 123
    var value2 = 456
    swapTwoValue(&value1, value2: &value2)
    print("value1: \(value1), value2: \(value2)")
    
    let queue = Queue(items: ["abc", 123, "cde"])
    let stack = Stack(items: ["cde", "abc", 123])
    if allItemsMatch(queue, stack) {
        print("queue 和 stack 完全的元素全都相同")
    }
}

// 1. 泛型函数
func swapTwoValue<T>(inout value1: T, inout value2: T) {
    let temp = value1
    value1 = value2
    value2 = temp
}

// 2. 泛型类型
struct Stack<Element> {
    var items = [Element]()
    
    //入栈
    mutating func pushStack(newElement: Element) {
        items.append(newElement)
    }
    
    //出栈
    mutating func popStack() -> Element {
        return items.removeLast()
    }
}

// 3. 泛型类型约束
// T 只能是 SomeClass 的子类
// U 只能是符合 SomeProtocol 协议的类型
func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
    // 这里是泛型函数的函数体部分
}

// 4. 关联类型，在协议中使用 associatedtype 定义关联类型
// 实现该协议的类型就可以使用某个指定的类型或者泛型来替换协议中的关联类型
protocol Container {
    associatedtype ItemType
    mutating func append(item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}

struct Queue<Element>: Container{
    var items = [Element]()
    mutating func append(item: Element) {
        items.append(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Element {
        return items[i]
    }
}

//通过扩展
extension Array: Container {}

// 5. 通过扩展一个存在的类型来指定关联类型
extension Stack: Container {
    mutating func append(item: Element) {
        items.append(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Element {
        return items[i]
    }
}

// 6. where 子句，泛型约束的条件语句
/**
 判断两容器中的元素是否都相同
 
 C1 必须符合 Container 协议（写作 C1: Container）。
 C2 必须符合 Container 协议（写作 C2: Container）。
 C1 的 ItemType 必须和 C2 的 ItemType类型相同（写作 C1.ItemType == C2.ItemType）。
 C1 的 ItemType 必须符合 Equatable 协议（写作 C1.ItemType: Equatable）。
 */

/**
 Swift 标准库中定义了一个 Equatable 协议，该协议要求任何遵循该协议的类型必须实现等式符（==）及不等符(!=)，从而能对该类型的任意两个值进行比较。所有的 Swift 标准类型自动支持 Equatable 协议。
 */
func allItemsMatch<C1: Container, C2: Container where C1.ItemType == C2.ItemType, C1.ItemType: Equatable> (someContainer: C1, _ anotherContainer: C2) -> Bool {
    
    //数量是否相等
    if someContainer.count != anotherContainer.count {
        return false
    }
    
    //元素是否相等
    var count = 0
    for index1 in 0 ..< someContainer.count {
        let item1 = someContainer[index1]
        
        for index2 in 0 ..< anotherContainer.count {
            if item1 == anotherContainer[index2] {
                count += 1
                continue
            }
        }
        
    }
    
    if count == someContainer.count {
        return true
    }
    
    return false
}



