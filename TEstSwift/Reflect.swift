//
//  ReflectTest.swift
//  TEstSwift
//
//  Created by Minstone on 14-6-23.
//  Copyright (c) 2014年 Minstone. All rights reserved.
//


//swift的反射
struct Person{
    let name: String
    let age: Int
}


class Fruit {
    var name = "Apple"
    var count = 0

    convenience init(name: String, count: Int){
        self.init()
        self.name = name
        self.count = count
    }
}

func outPrint(object: Any)
{
    let reflect = Mirror(reflecting: object)
    
    //类型
    let displayStyle = reflect.displayStyle!
    
    //实例类型
    let subjectType = reflect.subjectType
    
    //属性key-value集合
    let children = reflect.children
    
    print("object 是 \(displayStyle)")
    print("object 的类名: \(subjectType)")
    print("\(subjectType) 的属性个数是：\(children.count)")
    for (index, child) in children.enumerate() {
        print("第\(index)个属性名: \(child.label!)，值: \(child.value)")
    }
    print("\n")
}

func Reflect()
{
    let feini = Person(name: "菲妮", age: 18)
    outPrint(feini)
    
    let apple = Fruit(name: "苹果", count: 10)
    outPrint(apple)
    dump(apple) //系统输出children
}