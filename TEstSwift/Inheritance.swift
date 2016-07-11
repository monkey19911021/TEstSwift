//
//  Inheritance.swift
//  TEstSwift
//
//  Created by DONLINKS on 16/7/7.
//  Copyright © 2016年 Minstone. All rights reserved.
//

/**
 *  继承
 */

import Foundation

func inheritance(){
    
    let superClass = SuperClass()
    let subClass = SubClass()
    
    superClass.description()
    
    //子类调用重写的父类方法
    subClass.description()
    
    print("父类属性：\(superClass.property)\n")
    superClass.property = "hello"
    print("赋值后父类属性：\(superClass.property)")
    
    print("子类属性：\(subClass.property)\n")
    subClass.property = "hello"
    print("赋值后子类属性：\(subClass.property)\n")
}

//私有类
private class SuperClass{
    
    //私有变量
    private var _property: String = ""
    
    var property: String{
        get{
            print("父类属性 getter")
            
            if(_property.isEmpty){
                _property = "我是父类"
            }
            return _property
        }
        
        set{
            print("父类属性 setter")
            
            _property = newValue
        }
        
    }
    
    func description(){
        print("父类的方法")
    }
    
    
    subscript(code: String) -> String{
        return "hello, I'm superClass, code is \(code)"
    }
}

//不能被继承的类
final private class SubClass: SuperClass{
    
    //重写属性
    override var property: String{
        
        get{
            print("子类属性 getter")
            print("访问父类属性 getter：\(super.property)")
            
            
            if(_property.isEmpty){
                return "我是子类"
            }
            return _property
        }
        
        set{
            print("子类属性 setter")
            print("访问父类属性 setter:")
            super.property = "父类属性被赋值"
            
            _property = newValue
            
        }
        
    }
    
    //重写方法
    override func description() {
        super.description()
        print("子类的方法")
    }
    
    //重写下标
    override subscript(code: String) -> String{
        return "hello, I'm subClass, code is \(code)"
    }
    
    //不能被重写的方法
    final func finalFunc(){
        
    }
}