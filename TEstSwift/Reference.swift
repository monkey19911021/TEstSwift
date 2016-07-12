//
//  Reference.swift
//  TEstSwift
//
//  Created by DONLINKS on 16/7/11.
//  Copyright © 2016年 Minstone. All rights reserved.
//

/**
 *  引用
 *  1. 强引用：默认引用方式，属于内存指向
 *  2. 弱引用(weak)：引用可以没有值，声明带 ?，属于内存复制
 *  3. 无主引用(unowned)：引用永远有值，声明带 !，属于内存复制
 *
 */
import Foundation

func reference(){
    
    var tenant: Person? = Person(name: "MK")
    var apartment: Apartment? = Apartment(unit: "YiHao")
    
    tenant!.apartment = apartment
    tenant!.creditCard = Card(number: 123456, customer: tenant!)
    
    apartment!.tenant = tenant
    
    print(tenant!.description())
    
    print(tenant!.cardInfo(30.3))
    
    //由于 apartment 对 tenant 弱引用，所以 apartment 和 tenant 不会引起循环引用了
    apartment = nil
    
    tenant = nil
}

private class Person{
    
    let name: String
    var apartment: Apartment?   // apartment 和 tenant 两个都可以为空
    var creditCard: Card?       // creditCard 可以为空，但 customer 不能为空
    var idCard: Card!           // idCard 和 customer 都不能为空
    
    init(name _name: String){
        name = _name
    }
    
    //解决闭包引起的循环引用问题
    lazy var description: Void -> String = {
        //定义捕获列表，凡是引用类型的实例都要捕获，包括self
        // 1. 在闭包和捕获的实例总是互相引用并且总是同时销毁时，将闭包内的捕获定义为无主引用
        // 2. 如果被捕获的引用绝对不会变为nil，应该用无主引用
        // 3. 在被捕获的引用可能会变为nil时，将闭包内的捕获定义为弱引用
        [unowned self, weak _apartment = self.apartment] in
        
        var des = self.name + "住在" + _apartment!.unit
        
//        //如果直接使用 self 和 其他引用实例，会引起循环引用
//        var des = self.name + "住在" + self.apartment!.unit
        
        return des
    }
    
    //例子2
    lazy var cardInfo:(Float) -> String = {
        [unowned self, weak _card = self.creditCard!](余额: Float) -> String in
        var des = self.name + "的卡号为#" + String(_card!.number) + "的余额为：" + String(余额)
        return des
    }
    
    deinit{
        print("\(name) 已经释放")
    }
}

private class Apartment{
    
    let unit: String
    
    //弱引用
    weak var tenant: Person?
    
    init(unit _unit: String){
        unit = _unit
    }
    
    deinit{
        print("\(unit) 已经被释放")
    }
}

private class Card {
    let number: UInt64
    unowned let customer: Person
    init(number: UInt64, customer: Person) {
        self.number = number
        self.customer = customer
    }
    deinit { print("卡#\(number) 已经被释放") }
}