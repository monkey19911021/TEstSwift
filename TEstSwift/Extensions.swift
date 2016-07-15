//
//  Extensions.swift
//  TEstSwift
//
//  Created by DONLINKS on 16/7/15.
//  Copyright © 2016年 Minstone. All rights reserved.
//

/**
 *  扩展
 */
import Foundation

func extensions() {
    
    let sec: NSTimeInterval = 3665
    print(sec.min)
    print(sec.hour)
    
    3.repetitions {
        print($0)
    }
    
    var mu = 3
    mu.square()
    print("\(mu)")
    
    print(Person(name: "MK", color: "蓝色").kind)
}

// 1. 扩展添加计算属性
// 秒转时、分
extension NSTimeInterval {
    
    var min: (min: Int, sec: Int) {
        return (Int(self/60), Int(self%60))
    }
    
    var hour: (hour: Int, min: Int, sec: Int) {
        return (Int(self/3600), Int(self%3600/60), Int(self%60))
    }
    
}

// 2. 扩展添加构造器
private class Person {
    var name: String
    var age: Int?
    var color: String?
    init(name _name: String) {
        name = _name
    }
}

extension Person {
    //扩展只能添加便利构造器，指定构造器只能由原始类实现
    convenience init(name _name: String, age _age: Int) {
        self.init(name: _name)
        age = _age
    }
}

// 3. 扩展添加放法
extension Int {
    func repetitions(task: (String) -> Void) {
        //参数类型是一个无参数且无返回值的闭包
        for index in 0 ..< self {
            var start = ""
            for _ in 0 ... index{
                start += "⭐️"
            }
            task("\(start)")
        }
    }
}

// 4. 可变实例方法，用于在结构体和枚举类型中修改 self 或其属性
extension Int {
    mutating func square() {
        self = self * self
    }
}

// 5. 扩展添加下标
extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

// 6. 扩展为已有的类、结构体和枚举添加新的嵌套类型
extension Person {
    
    convenience init(name _name: String, color _color: String){
        self.init(name: _name)
        color = _color
    }
    
    enum 人种 {
        case 黄人
        case 黑人
        case 白人
        case 阿凡达
    }
    
    var kind: 人种 {
        switch self.color {
        case "黄色"?:
            return .黄人
        case "黑色"?:
            return .黑人
        case "白色"?:
            return .白人
        default:
            return .阿凡达
        }
    }
}

