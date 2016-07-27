//
//  Protocols.swift
//  TEstSwift
//
//  Created by DONLINKS on 16/7/20.
//  Copyright © 2016年 Minstone. All rights reserved.
//

/**
 协议
 类、结构体、枚举都可以使用协议
 */
import Foundation

func protocols() {
    
    let simonTheHamster = Hamster(name: "Simon")
    let somethingTextRepresentable: TextRepresentable = simonTheHamster
    print(somethingTextRepresentable.textualDescription)
    
    getPersonInfo(Person(name: "Tom", age: 18))
    
    protocolConforming()
}

//1. 基本协议使用
protocol SomeProtocol {
    //可读可写属性，不指定是存储属性还是计算属性
    var mustBeSettable: Int {set get}
    
    //只读属性，在协议里只能定义到不需要可写而已
    var doesNotNeedToBeSettable: Int {get}
    
    //类属性
    static var someTypeProperty: Int? {set get}
    
    //实例方法
    func someFunc() -> String
    
    //类方法
    static func someStaticFunc() -> String
}

//2. mutating
protocol Togglable {
    //当采用协议的实例需要改变实例的值类型属性的值时需要加 mutating 关键字
    //如果采用协议的是类类型则不用加 mutating
    mutating func toggle()
}

//3. 协议构造器
protocol initating {
    init(someParameter: Int)
}

class someClass: SomeProtocol, Togglable, initating {
    var mustBeSettable: Int = 0
    
    var doesNotNeedToBeSettable: Int {
        return 0
    }
    
    static var someTypeProperty: Int?//协议可选，类也要可选
    
    func someFunc() -> String {
        return "someFunc"
    }
    
    static func someStaticFunc() -> String {
        return "someStaticFunc"
    }
    
    func toggle() {
        mustBeSettable += 1
    }
    
    //实现协议提供的构造方法时必须加 required 来要求子类也必须实现这构造方法，如果类定义成 final 类型则不需要加
    required init(someParameter: Int) {
        mustBeSettable = someParameter
    }
}

struct someStruct: Togglable {
    var tog: Int = 0
    mutating func toggle() {
        tog += 1
    }
}

//4. 通过扩展添加协议一致性
class Dice {
    
}

protocol DiceProtocol {
    func textDice() -> String
}

extension Dice: DiceProtocol {
    func textDice() -> String {
        return "Dice Text"
    }
}

//5. 通过扩展采纳协议，如果一个类型符合协议中的所有要求，可以通过扩展来采纳协议
protocol TextRepresentable {
    var textualDescription: String { get }
}

struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}
extension Hamster: TextRepresentable {}

//6. 协议的继承，采纳子协议的类型也必须实现父协议的方法
protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}

class SnakesAndLadders: PrettyTextRepresentable {
    var textualDescription: String {
        return ""
    }
    
    var prettyTextualDescription: String {
        return ""
    }
}

//7. 类类型专属协议，只能是类来采纳该协议，不能是枚举或者结构体来采纳该协议
protocol classProtocol: class {
    func someFunc()
}

class SomeClassOnlyProtocol: classProtocol {
    func someFunc() {
        
    }
}

//8. 合并协议, protocol<协议1, 协议2>
protocol Name {
    var name: String {set get}
}

protocol Age {
    var age: Int {set get}
}

private class Person: Name, Age {
    var name: String
    var age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

func getPersonInfo(person: protocol<Name, Age>) {
    //函数参数类型为满足 Name 和 Age 协议的类型
    print("\(person.name), \(person.age)")
}

//9. 检查协议的一致性
/*
 is 用来检查实例是否符合某个协议，若符合则返回 true，否则返回 false。
 as? 返回一个可选值，当实例符合某个协议时，返回类型为协议类型的可选值，否则返回 nil。
 as! 将实例强制向下转换到某个协议类型，如果强转失败，会引发运行时错误。
 */
protocol HasArea {
    var area: Double { get }
}
class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) { self.radius = radius }
}
class Country: HasArea {
    var area: Double
    init(area: Double) { self.area = area }
}
class Animal {
    var legs: Int
    init(legs: Int) { self.legs = legs }
}

func protocolConforming() {
    let objects: [AnyObject] = [
        Circle(radius: 2.0),
        Country(area: 243_610),
        Animal(legs: 4)
    ]
    
    for object in objects {
        //1.
        if object is HasArea {
            let temp = object as! HasArea
            print("area: \(temp.area)")
        }
        
        //2.
        if let temp = object as? HasArea {
            print("area: \(temp.area)")
        }
    }
}

//10. 可选协议，只能类类型采纳该协议
@objc protocol OptionalProtocol: NSObjectProtocol {
    optional func optionFunc()
    optional var optionValue: Int { get }
}

// 10.1. 继承自 NSObject 的类并且添加 @objc 才能采纳包含可选方法的协议
@objc class optionProtocolClass1:NSObject, OptionalProtocol {
    func optionFunc(){
        
    }
}


//11. 通过扩展提供默认实现来实现可选协议，这样子类类型、枚举、结构体都能采纳该协议
protocol OptionalProtocol2 {
    func optionalMethod()        // 可选
    func necessaryMethod()       // 必须
    func anotherOptionalMethod() // 可选
}

extension OptionalProtocol2 {
    func optionalMethod() {
        print("Implemented in extension")
    }
    
    func anotherOptionalMethod() {
        print("Implemented in extension")
    }
}

class MyClass: OptionalProtocol2 {
    func necessaryMethod() {
        print("Implemented in Class3")
    }
    
    func optionalMethod() {
        print("Implemented in Class3")
    }
}



