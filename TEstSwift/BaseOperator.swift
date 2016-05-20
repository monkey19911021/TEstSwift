//
//  BaseOperator.swift
//  TEstSwift
//
//  Created by Minstone on 14-6-30.
//  Copyright (c) 2014年 Minstone. All rights reserved.
//

import Foundation

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
}