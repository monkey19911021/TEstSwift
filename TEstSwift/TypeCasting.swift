//
//  TypeCasting.swift
//  TEstSwift
//
//  Created by DONLINKS on 16/7/14.
//  Copyright © 2016年 Minstone. All rights reserved.
//

/**
 类型转换
 */
import Foundation

func typeCasting() {
    
    let group = [
        Man(name: "M0nk1y", wife: "FeiNi"),
        Woman(name: "FeiNi", husband: "M0nk1y"),
        Man(name: "man", wife: "woman"),
        Woman(name: "woman", husband: "man")
    ]
    
    // 1. 使用 is 来检查类型
    var manCount = 0
    var womanCount = 0
    for human in group {
        if human is Man {
            manCount += 1
        } else if human is Woman {
            womanCount += 1
        }
    }
    print("男的有：\(manCount)个，女的有： \(womanCount)个")
    
    // 2. 使用 as、as?、as! 来转换类型
    // 当转换类型不行明确是用 as? ，转换失败返回nil
    // 当转换类型明确时用 as! ，转换失败会报错
    for human in group {
        
        if let man = human as? Man {
            print("\(man.name)的老婆是\(man.wife)")
        } else if let woman = human as? Woman {
            print("\(woman.name)的老公是\(woman.husband)")
        }
        
    }
    
    // 3. Any 和 AnyObject
    // Any 可以表示任何类型，包括函数类型。
    // AnyObject 可以表示任何类类型的实例。
    let groupMan: [AnyObject] = [
        Man(name: "M0nk1y", wife: "FeiNi"),
        Man(name: "man", wife: "woman")
    ]
    //把 [AnyOject] 类型的数组转换成 [Man]
    for man in groupMan as! [Man] {
        print("\(man.name)的老婆是\(man.wife)")
    }
    
    
    // Any
    var things = [Any]()
    
    things.append(0)
    things.append(0.0)
    things.append(42)
    things.append(3.14159)
    things.append("hello")
    things.append(Man(name: "M0nk1y", wife: "FeiNi"))
    things.append({ (name: String) -> String in "Hello, \(name)" })
    
    for thing in things {
        switch thing {
        case 0 as Int:
            print("zero as an Int")
        case 0 as Double:
            print("zero as a Double")
        case let someInt as Int:
            print("an integer value of \(someInt)")
        case let someDouble as Double where someDouble > 0:
            print("a positive double value of \(someDouble)")
        case is Double:
            print("some other double value that I don't want to print")
        case let someString as String:
            print("a string value of \"\(someString)\"")
        case let (x, y) as (Double, Double):
            print("an (x, y) point at \(x), \(y)")
        case let man as Man:
            print("\(man.name)的老婆是\(man.wife)")
        case let stringConverter as String -> String:
            print(stringConverter("Michael"))
        default:
            print("something else")
        }
    }
}

private class Human {
    var name: String?
    init(name: String){
        self.name = name
    }
}

private class Man: Human {
    var wife: String?
    init(name _name: String, wife: String?){
        super.init(name: _name)
        self.wife = wife
    }
}

private class Woman: Human {
    var husband: String?
    init(name _name: String, husband: String?){
        super.init(name: _name)
        self.husband = husband
    }
}