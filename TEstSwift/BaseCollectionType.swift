//
//  BaseCollectionType.swift
//  TEstSwift
//
//  Created by Minstone on 14-6-30.
//  Copyright (c) 2014年 Minstone. All rights reserved.
//

import Foundation

//基本集合类型
func baseCollectionType()
{
    /*
    *  数组 ////////////////////////////////////////////////
    *  Array<SomeType>
    */
    
    //单类型数组
    var array = ["var1", "var2"]//但类型数组系统推断为ArrayType
    
    print("数组：\(array)")
    
    //混合类型数组
    var array2 = [1, 2, "1", "2"]  //混合类型数组系统推断为NSArray子类，没有isEmpty、append属性和方法
    
    //初始化
    var numbers: [Int] = [1, 2, 3];                    //控制元素所有类型都是Int
//    var numbers1 = Int[]()                              //控制所有元素类型为Int，并且为空
//    var numbers2 = Int[](count: 3, repeatedValue: 0)    //一共有三个元素，并且所有元素的值为0
    var numbers3 = Array(count:3, repeatedValue: 1)      //由于有类型推断机制存在所以可以用Array来初始化
    var numbers4 = Array(count:3, repeatedValue: 1.2 )
    
    //取数组和字典元素个数
    print("数组元素个数：\(array.count)")
    
    //数组是否为空
    array.isEmpty
    
    //数组添加元素  ArrayType
    array.append("appended")            //只能应用于同类型元素数组
//    array += "appended2"                //只能添加相同元素类型，可以是单个元素或者数组
    array += ["one", "two", "three"]    //数组合并
    print("添加元素后的数组：\(array)")
    
    //取元素
    print("数组第一个元素：\(array[0])");
//    println("数组第一到第二个元素: \(array[0..2])") //半闭区间运算符：..
    print("数组第一到第三个元素：\(array[0...2])") //闭区间运算符：...
    
    //替换元素
    array[0] = "numberOne"
    array[1...(array.count-1)] = ["numberTwo", "numberThree", "numberFour", "numberFive"]
    print("替换元素后的数组：\(array)");
    
    //删除元素
    var removed = array.removeAtIndex(4)
    //      array[0] = nil
    print("删除元素后的数组：\(array), 被删除的元素为：\(removed)");
    
    //插入元素
    array.insert("numberFive", atIndex:4)
    print("插入元素后的数组：\(array)");
    
    //遍历数组
    for value in array
    {
        print("元素：\(value)")
    }
    
    for (index, value) in array.enumerate()
    {
        print("第\(index)个元素的值为：\(value)");
    }
    
    
    
    
    
    
    print("\n\n\n\n\n")
    /*
    *  字典 ////////////////////////////////////////////////
    *  Dictionary<KeyType, ValueType>
    */
    //同类型字典
    var dic = ["key1": "value1", "key2": "value2"]
    //混合类型字典
    var dic2 = [1: 2, 11: "22", "1": "2", 1.0: 2.0] //键的值即使类型不一样但值一样都会被判断为同一个键
    
    //初始化
    var tempDic: Dictionary<Int, String> = [1: "1", 2: "2"]  //控制键值类型
    var tempDic1 = Dictionary<Int, String>()                 //空字典， 控制键值类型
    var tempDic2 = [:]                                       //空字典， 不控制键值类型
    
    //Dictionary<键类型， 值类型>(最小键值数量);
    var dic1 = Dictionary<Int, Double>(minimumCapacity: 2)
    
    
    //查看元素值
    print(dic["key1"]! + "," + "\(dic2[1])")   //有时系统判断不出字典的某键是否存在值，所以你肯定它有值得时候在表达式最后加上!， 不肯定的时候加?
    
    //添加元素
    //    dic["key3"] = "value3"
    dic.updateValue("value3", forKey: "key3")
    print("字典添加元素后为：" + dic["key3"]!)
    
    //修改元素
    //    dic["key3"] = "updateValue3"
    var beforeValue = dic.updateValue("updateValue3", forKey: "key3")
    print("字典修改元素后为：" + dic["key3"]! + "\n修改前的值为： " + beforeValue!) //如果key是原本字典不存在的，那么beforeValue将会为nil
    
    //删除一个键值对
    //    dic["key3"] = nil
    var removedValue = dic.removeValueForKey("key3")
    print("修改后的字典为：\(dic), 被删除的值为：\(removedValue)")
    
    
    //遍历字典
    //元素同类型遍历
    for (key, value) in dic
    {
        print("键：\(key), 值：\(value)")
    }
    
    //混合类型
//    for (key, value): (AnyObject, AnyObject) in dic2{
//        println("键：\(key), 值：\(value)")
//    }
}
