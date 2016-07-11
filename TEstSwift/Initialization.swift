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

private class MKClass{
    
    //为了规范，swift 中参数声明之后都要赋默认值
    var name: String = ""
    var age: Int = 0
    
    //可选属性，类实例化时自动赋值为 nil
    var nickName: String?
    
    //常量属性, 一旦被赋值不能更改
    let loverName: String
    
    //指定构造器，参数外部名和内部名
    init(name _name: String, age _age: Int){
        name = _name
        age = _age
        
        //若常量声明时没有赋值则类初始化时要赋值
        loverName = "FN"
    }
    
    //便利构造器
    convenience init(nickName _nickName: String){
        //必须先回调自身某个指定构造器
        self.init(name: "", age: 0)
        
        nickName = _nickName
    }
    
    //可失败构造器
    init?(name _name: String, age _age: Int, nickName _nickName: String){
        
        //可失败构造器返回 nil 表示构造失败
        if(name.isEmpty){
            return nil
        }
        
        name = _name
        age = _age
        nickName = _nickName
        loverName = "FN"
    }
    
    //必要构造器, 表示子类必须实现该构造器
    required init(){
        nickName = ""
        loverName = "FN"
    }
    
    func description() -> String{
        return "我的名字是：\(name), 今年\(age)岁。"
    }
}

//子类中的构造器：
private class SubMKClass: MKClass{
    
    var extra: String = ""
    
    //重写指定构造器
    override init(name _name: String, age _age: Int){
        //需要调用父类的构造器
        super.init(name: _name, age: _age)
        
        print("子类继承父类init")
    }
    
    //重写父类便利构造器, 不需要加 override
    init(nickName _nickName: String){
        //由于子类不能直接调用父类的便利构造器，所以只能调用其中一个指定构造器
        super.init(name: "", age: 0)
        
        nickName = _nickName
    }
    
    //重写可失败构造器，注意：
    //1. 非可失败构造器可以重写成可以摆构造器
    //2. 可以摆构造器只能重写成可失败构造器
    override init?(name _name: String, age _age: Int, nickName _nickName: String) {
        super.init(name: _name, age: _age, nickName: _nickName)
        
        if(age == 0){
            return nil
        }
    }
    
    //重写必要构造器，不需要写 override
    required init() {
        super.init()
    }
    
}