//
//  BaseFunction.swift
//  TEstSwift
//
//  Created by Minstone on 14-6-30.
//  Copyright (c) 2014年 Minstone. All rights reserved.
//

//(づ￣ ³￣)づ 📑 ლ(•̀ _ •́ ლ)

import Foundation

//基本函数式
func baseFunction()
{
    //函数，func 函数名(参数名1:类型， 参数名2:类型) -> （返回值类型1，返回值类型2）
    //正常性
    func greet(name:String, day:String) -> String{
        return "hello~~~\(name), today is \(day)"
    }
    print(greet("Tome", day: "1991-10-21"));
    
    //MARK: 数组参数
    func arrayParam(numbers: [Int]) -> (max: Int, min: Int)? //返回可选值
    {
        if numbers.isEmpty{
            return nil;
        }
        var currentMax = numbers[0]
        var currentMin = numbers[0]
        
        for number in numbers {
            if number > currentMax{
                currentMax = number
            }else if number < currentMin{
                currentMin = number
            }
        }
        return (currentMax, currentMin)
    }
    print("数组参数获取最大最小值：\(arrayParam([2, 1, 8, 9, 5]))");
    
    //MARK: 字典作为参数
    func dicParam(person: [String: String]){
        print("字典参数")
        for (key, value) in person{
            print("\(key): \(value)")
        }
    }
    dicParam(["name": "M0nk1y", "location": "GZ"])
   
    
    //MARK: 返回参数带名， 多参数时建议写上名字，方便阅读代码
    func greet2() -> (name: String, age: Int, tall: Float)
    {
        return ("name", 18, 190.131)
    }
    var result2 = greet2()
    print(result2.name)
    
    
    
    //MARK: 外部参数名, 这样在调用函数时更有表现力了
    func join(string1 s1: String, string2 s2: String, withJoiner joiner: String) -> String
    {
        //s1作为函数局部变量
        return s1 + joiner + s2
    }
    var joinResult = join(string1: "hello", string2: "world", withJoiner: ",")
    print("first: " + joinResult)
    
    //MARK: 匿名外部参数名
    func otherJoin(name: String, _ age: Int) -> String
    {
        return "name: \(name), age: \(age)"
    }
    var result = otherJoin("aa", 12)
    
    
    
    //MARK: 默认参数值，当参数被定义默认值时，调用函数可以不为这个参数赋值或者忽略这个参数
    func join2(string1 s1: String, string2 s2: String, withJoiner joiner: String = ",") -> String
    {
        //s1作为函数局部变量
        return s1 + joiner + s2
    }
    var joinResult3 = join2(string1: "hello", string2: "world")
    print("third: " + joinResult3)
    
    
    //MARK: 默认值参数的外部参数名, 给一个参数定义默认值时，它的参数名就变成了外部参数名
    func join3(string1: String = "", string2: String = "", joiner: String = ",") -> String
    {
        //s1作为函数局部变量
        return string1 + joiner + string2
    }
    var joinResult4 = join3("hello", string2: "world")
    print("fourth: " + joinResult4)
    
    
    
    //MARK: 可变参数
    //一个可变参数可以接受一个或多个值, 参数相当于一个数组类型变量， ###函数最多只能有一个可变参数，并且在多个参数情况下可变参数放在最后
    func averageMark(numbers: Double...) -> Double
    {
        var sum = 0.0;
        var count = 0;
        for mark in numbers
        {
            sum += mark
            count += 1
        }
        
        return sum/Double(count)
    }
    print("平均分为：\(averageMark(80.5, 92, 65, 78.8))")
    
    
    //MARK: 输入输出参数
    //输入输出参数, 相当于指针参数，参数在函数里改变之后会，原来实参的值也会改变
    //输入输出参数不能有默认值，而且可变参数不能用 inout 标记。如果你用 inout 标记一个参数，这个参数不能被 var 或者 let 标记。
    func swapTwoInts(inout a: Int, inout b: Int) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    var 小数字 = 3
    var 大数字 = 107
    print("小数字： \(小数字), 大数字： \(大数字)")
    swapTwoInts(&小数字, b: &大数字)  //当传入的参数作为输入输出参数时，需要在参数前加&符，表示这个值可以被函数修改。
    print("小数字变成： \(小数字), 大数字变成： \(大数字)")
    
    
    
    //MARK: 使用函数类型,即函数可以像变量一样，把函数执行块赋值给另一个函数
    func addTwoInts(i1: Int, i2: Int) -> Int
    {
        return i1 + i2
    }
    
    func multipTwoInts(i1: Int, i2: Int) -> Int
    {
        return i1 * i2
    }
    
    var mathFunction: (Int, Int) -> Int = addTwoInts //这样子，mathFunction的功能就变成addTwoInts一样了，只要参数类型、返回值类型相同
    print("Result: \(mathFunction(2, 3))")
    
    mathFunction = multipTwoInts
    print("Result: \(mathFunction(2, 3))")
    
    
    
    //MARK: 函数类型作为参数类型
    func printMathResult(function: (Int, Int) -> Int, a: Int, b: Int) {
        print("Result: \(function(a, b))")
    }
    printMathResult(addTwoInts, a: 3, b: 5)
    
    
    //MARK: 函数类型作为返回类型, 
    //即函数可以返回一个函数，但返回类型必须符合函数形式，函数形式：(参数类型1， 参数类型2) -> 返回类型
    func boyInfo(name: String, age: Int) -> String {
        return "男孩的名字是：\(name)，今年\(age)岁"
    }
    func girlInfo(name: String, age: Int) -> String {
        return "女孩的名字是：\(name)，今年\(age)岁"
    }
    
    func chooseFunction(isBoy: Bool) -> (String, age: Int) -> String { //它的返回类型是 (String, age: Int) -> String 的函数
        return isBoy ? boyInfo : girlInfo
    }
    
    var getInfo = chooseFunction(false)
    print("\(getInfo("玛丽", age: 18))")
    
    getInfo = chooseFunction(true)
    print("\(getInfo("汤姆", age: 20))")
    
    //MARK: 函数嵌套，即函数中可以再定义一个函数，作为内部函数，不对外使用
    func chooseStepFunction1(backwards: Bool) -> (Int) -> Int {
        func stepForward1(input: Int) -> Int { return input + 1 }
        func stepBackward1(input: Int) -> Int { return input - 1 }
        return backwards ? stepBackward1 : stepForward1
    }
}