//
//  BaseValue.swift
//  TEstSwift
//
//  Created by Minstone on 14-6-30.
//  Copyright (c) 2014年 Minstone. All rights reserved.
//

import Foundation

//基本类型
func baseValue(){
    
    //常量
    let letValue = 10000000
    print("常量：\(letValue)" )
    
    //变量
    var varValue = 10
    varValue += 10
    print("变量：\(varValue)")
    
    //基本类型声明（少用，swift可以自行推断变量类型）
    let varInt    : Int    = 1
    let vatDouble : Double = 1.0
    let varFloat  : Float  = 1.0
    let varBool   : Bool   = true
    let varString : String = "String"
    print("声明类型变量： Int: \(varInt)、Double: \(vatDouble)、Float: \(varFloat)、Bool: \(varBool)、String: \(varString)")
    
    
    //类型转换
    let UInt8Value  : UInt8 = UInt8.max
    print("UInt8转换成UInt16：\(UInt16(UInt8Value))")
    print("UInt8转换成String：\(String(UInt8Value))")
    print("UInt8转换成Double：\(Double(UInt8Value))")
    
    //一下特点只作为介绍，不建议使用
    
    //命名规则，可以用任何你喜欢的字符作为常量和变量名，包括 Unicode 字符
    /*
    *   常量与变量名不能包含数学符号，箭头，保留的（或者非法的）Unicode 码位，连线与制表符。也不能以数字开头，但是可以在常量与变量名的其他地方包含数字。
    */
    let π     = 3.14159
    let 刘家豪 = "刘家豪"
    let あああ = "あああ"
    let 🐶    = "🐶🐶🐶🐶🐶"    //表情符号也可以用上
    let 🐮    = "🐮🐮🐮🐮🐮"
    let ？？？ = "？？？"         //中文 ？
    
    print("π的值为\(π)")
    print("我的名字是：\(刘家豪)")
    print("这是日语喔：\(あああ)")
    print("一群可爱的小狗：\(🐶)")
    print("一群可爱的小牛：\(🐮)")
    print("这是中文的\(？？？)")
    
    //遍历字符串
    for character in 刘家豪.characters{
        print(character)
    }
    
    //计算字符数量
    print("刘家豪的长度为：\(刘家豪.characters.count)");
    
    //连接字符串
    let stringValue1 = "hello"
    let stringValue2 = stringValue1 + "!~~~~"
    let stringValue3 = stringValue2 + "\(π)"
    print(stringValue3);
    
    //字符串相等比较
    if(stringValue1 == "hello"){
        print("两字符串相等")
    }
    
    
    /*
    *   如果你需要使用与Swift保留关键字相同的名称作为常量或者变量名，你可以使用反引号（`）将关键字包围的方式将其作为名字使用。
    *   无论如何，你应当避免使用关键字作为常量或变量名，除非你别无选择。
    */
    let `var` = 10001
    print(`var`)
    
    
    
    
    
    
    //类型别名
    /*
    *  当你想要给现有类型起一个更有意义的名字时，类型别名非常有用
    */
    typealias intttt = Int
    let intvalue : intttt = intttt.max
    print(intvalue)
    
    
    //元组
    /*
    *  元组（tuples）把多个值组合成一个复合值。元组内的值可以使任意类型，并不要求是相同类型。
    *  作为函数返回值时，元组非常有用。
    */
    let httpStatus1 = (404, "Not Found")
    print("statusCode:\(httpStatus1.0),\nstatusMessage:\(httpStatus1.1)\n");
    
    let (tempStatusCode, tempStatusMessage) = httpStatus1
    print("statusCode:\(tempStatusCode),\nstatusMessage:\(tempStatusMessage)\n");
    
    let httpStatus2 = (statusCode : 404, statusMessage : "Not Found");
    print("statusCode:\(httpStatus2.statusCode),\nstatusMessage:\(httpStatus2.statusMessage)\n");
    
    //可选关键字
    /*
    *  当函数要不返回一个对象要不返回一个什么都没有的时候，可以用上Optional
    *  Swift 的可选可以让你暗示任意类型的值缺失，并不需要一个特殊值
    */
    
}