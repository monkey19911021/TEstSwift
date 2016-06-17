//
//  Properties.swift
//  TEstSwift
//
//  Created by DONLINKS on 16/6/17.
//  Copyright © 2016年 Minstone. All rights reserved.
//

import Foundation

struct MKNumbers
{
    //变量属性
    var firstNum: Int
    
    //常量属性,一旦初始化无法再改变值
    let lenght: Int
    
    //延迟存储属性
    lazy var lazyString = "延时操作"
    
    //计算属性
    var numArray: [Int]
    {
        get{
            var array: [Int] = []
            for num in firstNum ... (firstNum+lenght){
                array.append(num)
            }
            return array
        }
        
        //如果计算属性的 setter 没有定义表示新值的参数名，则可以使用默认名称 newValue
        set{
            firstNum = newValue[0]
        }
    }
    
    //只读计算属性
    //只有 getter 没有 setter 的计算属性就是只读计算属性
    var readonlyNum: Int{
        return numArray.count
    }
    
    //属性观察器
    var observeValue: String{
        //在新的值被设置之前调用
        willSet{
            print("新值: \(newValue)")
        }
        
        //在新的值被设置之后立即调用
        didSet{
            print("旧值: \(oldValue)")
        }
    }
    
}


class SomeClass
{
    //类型属性，属于延迟属性
    //无论创建了多少个该类型的实例，这些属性都只有唯一一份
    static var classAttr: String = ""
    
    //使用 class 来声明类型属性时，它只能是个只读属性
    class var classAttr2: String{
        return "class 声明类型属性"
    }
}

func properties()
{
    //如果结构体声明为常量后，变量属性也不能修改值
    var nums = MKNumbers(firstNum: 5, lenght: 5, lazyString: "aaa", observeValue: "ABC")
    print("\(nums.numArray)")
    
    //由于使用了 lazy ，lazyString 属性只有在第一次被访问的时候才被创建
    print("\(nums.lazyString)")
    
    nums.numArray = [99, 100, 101]
    print("\(nums.firstNum)")
    
    //属性观察器
    nums.observeValue = "CDE"
    
    print("\(SomeClass.classAttr2)")
}