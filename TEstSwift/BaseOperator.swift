//
//  BaseOperator.swift
//  TEstSwift
//
//  Created by Minstone on 14-6-30.
//  Copyright (c) 2014年 Minstone. All rights reserved.
//

//关于 Swift 标准库提供的运算符的结合性与优先级，请参考 https://developer.apple.com/library/ios/documentation/Swift/Reference/Swift_StandardLibrary_Operators/index.html#//apple_ref/swift/opfunc/s:ZFsoi2reFTRSfSf_T_

import Foundation

struct Vector2D{
    var x = 0.0
    var y = 0.0
}

//基本运算符
func baseOperator()
{
    //MARK: swift中支持了浮点运算的取余运算
    print(8 % 2.5)
    
    print("\n")
    
    //MARK: 恒等（===）和不恒等（!==）
    let obj1 = NSObject()
    let obj2 = obj1
    let obj3 = NSObject()
    if obj1 === obj2{
        print("\(obj1) 与 \(obj2)恒等")
    }
    if obj1 !== obj3{
        print("\(obj1) 与 \(obj3)不恒等")
    }
    
    print("\n")
    
    
    //MARK: 空合运算符 (??)
    let defaultColorName = "red"
    var userDefinedColorName: String?   //默认值为 nil
    let colorNameToUse = userDefinedColorName ?? defaultColorName
    print("空合运算: \(userDefinedColorName) ?? \(defaultColorName) = \(colorNameToUse)")
    userDefinedColorName = "..."
    
    print("\n")
    
    
    //MARK: 闭区间运算符 (...)
    for index in  1...3{
        print("\(index)")
    }
    
    //MARK: 半开区间运算符 (..<)
    for index in  1..<3{
        print("\(index)")
    }
    
    print("\n")
    
    //MARK: 溢出运算符
    /*
        溢出加法 &+
        溢出减法 &-
        溢出乘法 &*
    */
    
    let maxInt = INT_MAX;
    print("最大整型：\(maxInt), &+1: \(maxInt &+ 1)")
    
    
    var v1 = Vector2D(x: 1.0, y: 4.0)
    let v2 = Vector2D(x: 2.0, y: 3.0)
    print("v1: \(v1), v2: \(v2)")
    print("v1+v2: \(v1 + v2)")
    v1 = -v1
    print("-v1: \(v1)")
    print("v1||: \(v1||)")
    print("v1++: \(v1++)")
    print("v1 += v2 : \(v1 += v2)")
    print("v1 + v1 +- v2 + v2: \(v1 + v1 +- v2 + v2)");
}

//MARK: 运算符函数(运算符重载)
func + (left: Vector2D, right: Vector2D) -> Vector2D{
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
}

//MARK: 前缀运算符
//变负数
prefix func - (vector: Vector2D) -> Vector2D{
    return Vector2D(x: -vector.x, y: -vector.y)
}

//MARK: 后缀运算符
//自增1
postfix func ++ (inout vector: Vector2D) -> Vector2D{
    vector = Vector2D(x: vector.x+1, y: vector.y+1)
    return vector
}

//MARK: 复合赋值运算符
func += (inout left: Vector2D, right: Vector2D) -> Vector2D{
    left = Vector2D(x: left.x + right.x, y: left.y + right.y)
    return left
}

//MARK: 等价运算符
func == (left: Vector2D, right: Vector2D) -> Bool{
    return (left.x == right.x) && (left.y == right.y)
}

func != (left: Vector2D, right: Vector2D) -> Bool{
    return !(left == right)
}

//MARK: 自定义运算符
//新的运算符要使用 operator 关键字在全局作用域内进行定义，同时还要指定 prefix、infix 或者 postfix 修饰符
postfix operator || {}
//绝对值
postfix func || (vector: Vector2D) -> Vector2D{
    return Vector2D(x: abs(vector.x), y: abs(vector.y))
}

//MARK: 自定义中缀运算符的优先级和结合性
/*结合性可取的值有left，right 和 none。
 当左结合运算符跟其他相同优先级的左结合运算符写在一起时，会跟左边的值进行结合。
 同理，当右结合运算符跟其他相同优先级的右结合运算符写在一起时，会跟右边的值进行结合。
 而非结合运算符不能跟其他相同优先级的运算符写在一起。*/

//结合性的默认值是 none，优先级的默认值 10
infix operator +- { associativity left precedence 140 }
func +- (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y - right.y)
}

