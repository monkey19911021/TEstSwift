//
//  Initialization.swift
//  TEstSwift
//
//  Created by DONLINKS on 16/7/8.
//  Copyright © 2016年 Minstone. All rights reserved.
//

/**
 *  构造过程
 */

import Foundation

func initialization(){
    
    let mk = MKClass(name: "M0nk1y", age: 20)
    print(mk.description());
    
}

class MKClass{
    
    //为了规范，swift 中参数声明之后都要赋默认值
    var name: String = ""
    var age: Int = 0
    
    //可选属性，类实例化时自动赋值为 nil
    var nickName: String?
    
    //常量属性, 一旦被赋值不能更改
    let loverName: String
    
    //参数外部名和内部名
    init(name _name: String, age _age: Int){
        name = _name
        age = _age
        
        //若常量声明时没有赋值则类初始化时要赋值
        loverName = "FN"
    }
    
    func description() -> String{
        return "我的名字是：\(name), 今年\(age)岁。"
    }
}