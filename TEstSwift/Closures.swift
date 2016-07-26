//
//  Closures.swift
//  TEstSwift
//
//  Created by Minstone on 14-6-30.
//  Copyright (c) 2014年 Minstone. All rights reserved.
//

//(づ￣ ³￣)づ 📑 ლ(•̀ _ •́ ლ)

import Foundation

//闭包
//Swift 中的闭包与 C 和 Objective-C 中的代码块（blocks）以及其他一些编程语言中的匿名函数比较相似
func closures()
{
    //MARK: 基本用法
//    { (parameters) -> returnType in
//        statements
//    }
    let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
    
    //一般用法
    func namesSortFun(s1: String, s2: String) -> Bool {
        return s1 < s2
    }
    var namesSorted = names.sort(namesSortFun);
    print("函数参数式：\(namesSorted)")
    
    //使用闭包
    namesSorted = names.sort({(s1: String, s2: String) -> Bool in
        return s1 < s2
    })
    print("闭包：\(namesSorted)")
    
    //MARK: 根据上下文推断类型
    /*
     通过内联闭包表达式构造的闭包作为参数传递给函数或方法时，都可以推断出闭包的参数和返回值类型。 
     这意味着闭包作为函数或者方法的参数时，您可以省略参数类型和返回类型
     */
    namesSorted = names.sort({s1, s2 in return s1 < s2})
    print("闭包上下文推断类型：\(namesSorted)")
    
    //MARK: 单行表达式闭包隐式返回
    //单行表达式闭包可以通过省略return关键字来隐式返回单行表达式的结果
    namesSorted = names.sort({s1, s2 in s1 < s2})
    print("单行表达式闭包隐式返回: \(namesSorted)")
    
    //MARK: 参数名称缩写
    //Swift 自动为内联闭包提供了参数名称缩写功能，您可以直接通过$0，$1，$2来顺序调用闭包的参数
    namesSorted = names.sort({$0 < $1})
    print("参数名称缩写：\(namesSorted)")
    
    //MARK: 运算符函数
    /*
     Swift 的String类型定义了关于大于号（>）的字符串实现，
     其作为一个函数接受两个String类型的参数并返回Bool类型的值。
     而这正好与sort(_:)方法的参数需要的函数类型相符合
     */
    namesSorted = names.sort(<)
    print("运算符函数：\(namesSorted)")
    
    //MArK: 尾随闭包
    //尾随闭包是一个书写在函数括号之后的闭包表达式，函数支持将其作为最后一个参数调用
    namesSorted = names.sort() {$0 < $1}
    
    //如果函数只需要闭包表达式一个参数，则可以把 () 省略
    namesSorted = names.sort {$0 < $1}
    
    print("尾随闭包：\(namesSorted)")
    
    
    let numberString = [
        0: "零", 1: "壹", 2: "贰", 3: "叁", 4: "肆",
        5: "伍", 6: "陆", 7: "柒", 8: "捌", 9: "玖"
    ]
    let numbers = [157, 189, 21858]
    let exchangeStr = numbers.map { (number) -> String in
        var num = number
        var outPut = ""
        while num > 0{
            outPut = numberString[num%10]! + outPut
            num /= 10
        }
        return outPut
    }
    print(exchangeStr)
    
    
    //MARK: 捕获值
    func makeIncrementor(forIncrement amount: Int) -> () -> Int{
        var runningTotal = 0
        func incrementor() -> Int{
            //runningTotal 引用了函数外的变量，每次调用 makeIncrementor() 的时候都会直接返回 incrementor 函数，runningTotal 的值都不会被重新初始化
            runningTotal += amount
            return runningTotal
        }
        return incrementor
    }
    
    let incrementByTen = makeIncrementor(forIncrement: 10)
    print("\(incrementByTen())")
    print("\(incrementByTen())")
    print("\(incrementByTen())")
    
    
    //MARK: 非逃逸闭包
    //在参数名之前标注@noescape，用来指明这个闭包是不允许在这个函数执行完之后执行
    func someFunctionWithNoescapeClosure(@noescape closure: () -> Void) {
        closure()
    }
    
    //逃逸闭包，把闭包添加到函数定义外的数组中
    var completionHandlers: [() -> Void] = []
    func someFunctionWithEscapingClosure(completionHandler: () -> Void) {
        completionHandlers.append(completionHandler)
    }
    
    //MARK: 自动闭包
    /*
     自动闭包是一种自动创建的闭包，用于包装传递给函数作为参数的表达式。
     这种闭包不接受任何参数，当它被调用的时候，会返回被包装在其中的表达式的值。
     这种便利语法让你能够用一个普通的表达式来代替显式的闭包，从而省略闭包的花括号
     */
    var array = ["one", "two", "three", "four", "five", "six"]
    let removeEle = {array.removeFirst()}
    print("自动闭包执行前：")
    print(array)
    print("自动闭包执行后：\(removeEle())!")
    print(array)
    
    //将闭包作为参数传递给函数时，你能获得同样的延时求值行为
    func serveCustomer1(customerProvider: () -> String) {
        print("自动闭包执行后: \(customerProvider())!")
        print(array)
    }
    serveCustomer1( { array.removeFirst() } )
    
    //MARK: @autoclosure
    //通过将参数标记为 @autoclosure 来接收一个自动闭包。现在你可以将该函数当做接受 String 类型参数的函数来调用
    //@autoclosure特性暗含了@noescape特性
    func serveCustomer2(@autoclosure customerProvider: () -> String) {
        print("自动闭包执行后: \(customerProvider())!")
        print(array)
    }
    serveCustomer2(array.removeFirst())
    
    //MARK: @autoclosure(escaping)
    //如果你想让这个闭包可以“逃逸”，则应该使用@autoclosure(escaping)特性
    var customerProviders: [() -> String] = []
    func collectCustomerProviders(@autoclosure(escaping) customerProvider: () -> String) {
        customerProviders.append(customerProvider)
    }
    collectCustomerProviders(array.removeFirst())
    collectCustomerProviders(array.removeFirst())
    
    print("收集到 \(customerProviders.count) 个闭包.")
    for customerProvider in customerProviders {
        print("自动闭包执行后: \(customerProvider())!")
        print(array)
    }

}