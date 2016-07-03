//
//  Methods.swift
//  TEstSwift
//
//  Created by Liujh on 16/7/3.
//  Copyright © 2016年 Minstone. All rights reserved.
//

import Foundation


func methods()
{
    let counter = Counter()
    counter.increment()
    print(counter.count)
    
    counter.incrementBy(3, numberOfTimes: 5)
    print(counter.count)
    
    //值类型方法
    var point = MutablePoint(x: 0, y: 0)
    point.moveByX(5, y: 5)
    print(point)
    
    //枚举方法
    var tri = TriStateSwitch.Off
    print("tri 现在的值：\(tri)")
    tri.next()
    print("tri 现在的值：\(tri)")
    
}

class Counter
{
    var count: Int = 0
    
    func increment(){
        count += 1
    }
    
    func incrementBy(amount: Int, numberOfTimes: Int){
        count += (amount * numberOfTimes)
    }
    
    //类方法
    static func instance() -> Counter{
        return Counter();
    }
    
    //可被子类重写的类方法
    class func version(){
        print("version 1.0");
    }
}

//结构体和枚举是值类型。默认情况下，值类型的属性不能在它的实例方法中被修改。
//使用 mutating 的方法可以修改值类型的实例的值
struct MutablePoint {
    var x = 0.0
    var y = 0.0
    
    mutating func moveByX(deltaX: Double, y deltaY: Double){
        x += deltaX
        y += deltaY
    }
}

//枚举方法
enum TriStateSwitch{
    
    case Off, Low, High
    
    mutating func next(){
        
        switch self {
        case .Off:
            self = .Low
        case .Low:
            self = .High
        case .High:
            self = .Off
        }
        
    }
    
}