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
    
    //下标接收多参数
    var matrix = Matrix(rows: 3, columns: 3)
    matrix.grid = [1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 1.9]
    print("grid[2, 2]: \(matrix[1, 2])");
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
    
    init(rows: Int, columns: Int){
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue: 0.0)
    }
    
    func indexIsValidForRow(row: Int, _ column: Int) -> Bool{
        return (row >= 0 && row < rows && column >= 0 && column < columns)
    }
    
    subscript(row: Int, column: Int) -> Double{
        get{
            assert(indexIsValidForRow(row, column), "坐标不在范围内")
            return grid[row * columns + column]
        }
        
        set{
            assert(indexIsValidForRow(row, column), "坐标不在范围内")
            grid[row * columns + column] = newValue
        }
    }
}