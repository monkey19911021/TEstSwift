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
    
}

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

protocol Togglable {
    //当采用协议的实例需要改变实例的值类型属性的值时需要加 mutating 关键字
    //如果采用协议的是类类型则不用加 mutating
    mutating func toggle()
}

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

//通过扩展添加协议一致性
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
