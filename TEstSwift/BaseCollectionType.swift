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
    //MARK: 数组
    /*
    *  数组 ////////////////////////////////////////////////
    *  Array<SomeType>
    */
    
    //单类型数组
    var array = ["var1", "var2"]//但类型数组系统推断为ArrayType
    print("普通数组：\(array)")
    
    //混合类型数组
    let array2 = [1, 2, "1", "2"]  //混合类型数组系统推断为NSArray子类，没有isEmpty、append属性和方法
    print("混合类型数组：\(array2)")
    
    
    //初始化
    let numbers: [Int] = [1, 2, 3];                    //控制元素所有类型都是Int
    let numbers1 = [Int]()                              //控制所有元素类型为Int，并且为空
    let numbers2 = [Int](count: 3, repeatedValue: 0)    //一共有三个元素，并且所有元素的值为0
    let numbers3 = Array(count:3, repeatedValue: 1)      //由于有类型推断机制存在所以可以用Array来初始化
    let numbers4 = Array(count:3, repeatedValue: 1.2 )
    
    print("numbers:\(numbers)")
    print("numbers1:\(numbers1)")
    print("numbers2:\(numbers2)")
    print("numbers3:\(numbers3)")
    print("numbers4:\(numbers4)")
    
    //取数组和字典元素个数
    print("数组元素个数：\(array.count)")
    
    //数组是否为空
    array.isEmpty
    
    //数组添加元素  ArrayType
    array.append("appended")            //只能应用于同类型元素数组
    array += ["one", "two", "three"]    //数组合并
    print("添加元素后的数组：\(array)")
    
    //取元素
    print("数组第一个元素：\(array[0])");
    print("数组第一到第二个元素: \(array[0..<2])") //半闭区间运算符：..<
    print("数组第一到第三个元素：\(array[0...2])") //闭区间运算符：...
    
    //替换元素
    array[0] = "numberOne"
    array[1...(array.count-1)] = ["numberTwo", "numberThree", "numberFour", "numberFive"]
    print("替换元素后的数组：\(array)");
    
    //删除元素
    let removed = array.removeAtIndex(4)
//    array.removeLast()
//    array.removeFirst()
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
    
    //MARK: 集合 Set，大部分用法跟数组一样
    //初始化
    var letters = Set<Character>()
    let favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop", "Hip hop"] //集合会把相同的对象过滤
    print("集合: \(letters)")
    print("集合: \(favoriteGenres)")
    
    letters.insert("a")//插入
    letters = [] //清空
    
    //基本集合操作
    let oddDigits: Set = [1, 3, 5, 7, 9]
    let evenDigits: Set = [0, 2, 4, 6, 8]
    let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
    
    let unionSet = oddDigits.union(evenDigits).sort() //取并集
    // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    let intersectSet = oddDigits.intersect(evenDigits).sort() //取交集
    // []
    let subtractSet = oddDigits.subtract(singleDigitPrimeNumbers).sort()//根据不在该集合中的值创建一个新的集合
    // [1, 9]
    let exclusiveOrSet = oddDigits.exclusiveOr(singleDigitPrimeNumbers).sort()//根据在一个集合中但不在两个集合中的值创建一个新的集合
    // [1, 2, 9]
    
    print("取两集合并集: \(unionSet)")
    print("取两集合交集: \(intersectSet)")
    print("subtractSet: \(subtractSet)")
    print("exclusiveOrSet: \(exclusiveOrSet)")
    
    let houseAnimals: Set = ["🐶", "🐱"]
    let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
    let cityAnimals: Set = ["🐦", "🐭"]
    
    _ = houseAnimals.isSubsetOf(farmAnimals) //houseAnimals 是否 farmAnimals 的子集
    // true
    _ = farmAnimals.isSupersetOf(houseAnimals) // farmAnimals 是否 houseAnimals 的超集
    // true
    _ = farmAnimals.isDisjointWith(cityAnimals) //是否没有交集
    // true
    
    print("\n\n\n\n\n")
    
    //MARK: 字典
    /*
    *  字典 ////////////////////////////////////////////////
    *  Dictionary<KeyType, ValueType>
    */
    //同类型字典
    var dic = ["key1": "value1", "key2": "value2"]
    //混合类型字典
    var dic2 = [1: 2, 11: "22", "1": "2"] //键的值即使类型不一样但值一样都会被判断为同一个键
    
    //初始化
    _ = [Int: String]()
    let tempDic: [Int: String] = [1: "1", 2: "2"]  //控制键值类型
    let tempDic1: Dictionary<Int, String> = [1: "1", 2: "2"]  //控制键值类型
    
    _ = Dictionary<Int, String>()                 //空字典， 控制键值类型
    _ = [:]                                       //空字典， 不控制键值类型
    
    print(tempDic)
    print(tempDic1)
    
    //Dictionary<键类型， 值类型>(最小键值数量);
    _ = Dictionary<Int, Double>(minimumCapacity: 2)
    
    //是否为空
    dic.isEmpty
    
    //数量
    dic.count
    
    //查看元素值
    print(dic["key1"]! + "," + "\(dic2[1])")   //有时系统判断不出字典的某键是否存在值，所以你肯定它有值得时候在表达式最后加上!， 不肯定的时候加?
    
    //添加元素
    dic["key3"] = "value3"
    dic.updateValue("value3", forKey: "key3")
    print("字典添加元素后为：" + dic["key3"]!)
    
    //修改元素
    dic["key3"] = "updateValue3"
    let beforeValue = dic.updateValue("updateValue3", forKey: "key3")
    print("字典修改元素后为：" + dic["key3"]! + "\n修改前的值为： " + beforeValue!) //如果key是原本字典不存在的，那么beforeValue将会为nil
    
    //删除一个键值对
    dic["key3"] = nil
    let removedValue = dic.removeValueForKey("key3")
    print("修改后的字典为：\(dic), 被删除的值为：\(removedValue)")
    
    
    //遍历字典
    //元素同类型遍历
    for (key, value) in dic
    {
        print("键：\(key), 值：\(value)")
    }
    
    //混合类型
    for (key, value) in dic2{
        print("dic2 键：\(key), 值：\(value)")
    }
}
