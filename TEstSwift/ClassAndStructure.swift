//
//  ClassAndStructure.swift
//  TEstSwift
//
//  Created by DONLINKS on 16/6/12.
//  Copyright © 2016年 Minstone. All rights reserved.
//

import Foundation

//结构体和枚举都是值类型
struct Resolution {
    var width = 0
    var height = 0
}

//类是引用类型
class VideoMode{
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

//存储属性和计算属性
struct Point{
    var x = 0.0
    var y = 0.0
}

struct Size {
    var width = 0.0
    var height = 0.0
}

struct Rect {
    //存储属性
    var origin = Point()
    var size = Size()
    
    //计算属性
    var center: Point{
        get{
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        
        //newValue为默认参数
        set{
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}


//NSArray 和 Array
/*
 Swift 中，许多基本类型，诸如String，Array和Dictionary类型均以结构体的形式实现。这意味着被赋值给新的常量或变量，或者被传入函数或方法中时，它们的值会被拷贝。
 
 Objective-C 中NSString，NSArray和NSDictionary类型均以类的形式实现，而并非结构体。它们在被赋值或者被传入函数或方法时，不会发生值拷贝，而是传递现有实例的引用。
 */
func NSArrayAndArray()
{
    let nsArray = NSMutableArray(array: ["1", "2"])
    let array = ["1", "2"]
    
    print("改变前\n nsArray: \(nsArray) \n array:\(array)")
    
    //拷贝
    let nsArray1 = nsArray  //NSArray属于浅拷贝，值引用，改变副本值会改变正本值
    var array1 = array      //Array属于深拷贝，值拷贝，改变副本值不会影响正本值
    
    nsArray1[0] = "3"
    nsArray1[1] = "4"
    
    array1[0] = "3"
    array1[1] = "4"
    
    print("改变后\n nsArray: \(nsArray) \n array:\(array)")
}

func classAndStructure()
{
    let hd = Resolution(width: 1920, height: 1080)
    print("\(hd)")
    
    
    var square = Rect(origin: Point(x: 0.0, y: 0.0),
                      size: Size(width: 10.0, height: 10.0))
    let initialSquareCenter = square.center
    print("initialSquareCenter: \(initialSquareCenter)")
    square.center = Point(x: 15.0, y: 15.0)
    print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
    
    NSArrayAndArray()
}

