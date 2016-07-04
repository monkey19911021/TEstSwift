//
//  Subscripts.swift
//  TEstSwift
//
//  Created by Liujh on 16/7/3.
//  Copyright © 2016年 Minstone. All rights reserved.
//

import Foundation

func subscripts(){
    
    var timesTable = TimesTabel()
    timesTable.multipler = 5
    print("整型下标：\(timesTable[3])")
    print("字符串下标：\(timesTable["hello"])")
    
    timesTable[3] = 90
    print("为带下标实例赋值后：\(timesTable.multipler)")
}

struct TimesTabel{
    var multipler: Int = 0
    
    //可以定义多个下标，通过不同的参数类型进行重载
    //下标可以设定为读写或只读，跟计算属性一样
    subscript(index: Int) -> Int{
        get{
            return multipler * index
        }
        set{
            
            multipler = newValue/index
            
        }
    }
    
    //只返回 getter 就是只读下标
    subscript(str: String) -> String{
        var result = ""
        for _ in 0 ... multipler{
            result += str + ", "
        }
        return result;
    }
}

struct Matrix{
    let rows: Int, columns: Int
    var grid: [Double]
    
}