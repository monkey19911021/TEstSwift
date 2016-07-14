//
//  BaseConstruct.swift
//  TEstSwift
//
//  Created by Minstone on 14-6-30.
//  Copyright (c) 2014年 Minstone. All rights reserved.
//

import Foundation

//基本控制流
func controlFlow()
{
    /*
    * For 循环////////////////////////////////////////////////////
    */
    
    /*
    * for-in
    * 用来更简单地遍历数组(array)，字典(dictionary)，范围（range），字符串（string）和其他序列类型
    */
    
    //使用 ... 制造for范围, 相当于 i > = min && i <= max
    for i in 1...5
    {
        print(i)
    }
    
    //不需要知道循环每一项的值,可以使用下划线（_）替代变量名来忽略对值的访问
    for _ in 1...5
    {
        print("*", terminator: ", ")
    }
    
    
    //repeat-while
    var repeatCount = 0;
    repeat{
        repeatCount += 1;
        print(repeatCount)
    }while repeatCount > 3
    
    
    /*
    * switch分支 ////////////////////////////////////////////////////
    * switch 的case可以匹配多种类型的数据，整形，浮点型，字符串等等
    * case 还可以匹配更多的类型模式，包括范围（range）匹配，元组（tuple）和特定类型的描述。
    * switch case 语句中匹配的值可以是由 case 体内部临时的常量或者变量决定，也可以由 where 分句描述更复杂的匹配条件
    * switch不需要显示调用break了， 匹配多模式时使用（,）分隔
    */
    let vegetable = "red pepper"
    var vegetableComment = ""
    switch vegetable {
    case "celery":
        vegetableComment = "Add some raisins and make ants on a log."
    case "cucumber", "watercress":
        vegetableComment = "That would make a good tea sandwich."
    case let x where x.hasSuffix("pepper"):
        vegetableComment = "Is it a spicy \(x)?"
    default:
        vegetableComment = "Everything tastes good in soup."
    }
    print(vegetableComment)
    
    
    //区间匹配
    let count = random()
    let countedThings = "stars in the Milky Way"
    var naturalCount: String
    switch count {
    case 0:
//        naturalCount = "no"
        fallthrough //使用贯穿关键字， 执行完case 0, 再进行判断case1...3
    case 1...3:
        naturalCount = "a few"
    case 4...9:
        naturalCount = "several"
    case 10...99:
        naturalCount = "tens of"
    case 100...999:
        naturalCount = "hundreds of"
    case 1000...999_999:
        naturalCount = "thousands of"
    default:
        naturalCount = "millions and millions of"
    }
    print("\(count)  There are \(naturalCount) \(countedThings).")
    
    //MARK: 元组匹配
    let somePoint = (random()%10, random()%10)
    switch somePoint {
    case (0, 0):
        print("(0, 0) 是一个原点")
    case (_, 0):
        print("(\(somePoint.0), 0) 在X轴上")
    case (0, _):
        print("(0, \(somePoint.1)) 再Y轴上")
    case (-2...2, -2...2):
        print("(\(somePoint.0), \(somePoint.1)) 在一个以原点为中心的4x4正方形内")
    default:
        print("(\(somePoint.0), \(somePoint.1)) 不在目标正方形内")
    }
    
    //值绑定
    let anotherPoint = (rand()%10, rand()%10)
    switch anotherPoint {
    case (let x, 0): //符合（xx, 0）的值，并把值赋给x
        print("on the x-axis with an x value of \(x)")
    case (0, let y):
        print("on the y-axis with a y value of \(y)")
    case let (x, y):
        print("somewhere else at (\(x), \(y))")
    }
    
    //where 语句， case 分支的模式可以使用where语句来判断额外的条件
    let yetAnotherPoint = (rand()%10, rand()%10)
    switch yetAnotherPoint {
    case let (x, y) where x == y:
        print("(\(x), \(y)) x等于y")
    case let (x, y) where x == -y:
        print("(\(x), \(y)) x等于y的负数")
    case let (x, y):
        print("(\(x), \(y)) 是其他点")
    }
    
    
    //控制转移语句
    /*
    * continue
    */
    /*
    * break
    */
    /*
    * fallthrough //贯穿
    * switch 分支语句里已经不需要写break语句了，但是如果还是想沿用C的switch分支，就需要在case后添加fallthrough,以贯穿到下一个分支语句
    */
    /*
    * return
    */
    
    //MARK: guard
    greet(["name": "M0nk1y"])
    
    
    //MARK: 检测 API 可用性
    if #available(iOS 9, OSX 10.10, watchOS 1.0, *){
        // 在 iOS 使用 iOS 9 的 API, 在 OS X 使用 OS X v10.10 的 API
    }else{
        // 使用先前版本的 iOS 和 OS X 的 API
    }
    
}

//guard - else 用法, guard 布尔值 else 布尔值为假时执行语句
func greet(person: [String: String]) {
    //若不满足条件则提前退出方法
    guard let name = person["name"] else {
        return
    }
    print("Hello \(name)")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    print("I hope the weather is nice in \(location).")
}