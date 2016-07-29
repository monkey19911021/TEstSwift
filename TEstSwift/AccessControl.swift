//
//  AccessControl.swift
//  TEstSwift
//
//  Created by DONLINKS on 16/7/28.
//  Copyright © 2016年 Minstone. All rights reserved.
//

/**
 访问控制
 */
import Foundation

func accessControl() {

}

// 1. public：可以访问同一模块源文件中的任何实体，在模块外也可以通过导入该模块来访问源文件里的所有实体。通常情况下，框架中的某个接口可以被任何人使用时，你可以将其设置为 public 级别。
public class PublicClass {
    func sayHi() {
        print("Hi~")
    }
}

// 2. internal：可以访问同一模块源文件中的任何实体，但是不能从模块外访问该模块源文件中的实体。通常情况下，某个接口只在应用程序或框架内部使用时，你可以将其设置为 internal 级别。
internal class InternalClass {
    func sayHi() {
        print("Hi~")
    }
}

// 3. private：限制实体只能在所在的源文件内部使用。使用 private 级别可以隐藏某些功能的实现细节。
private class PrivateClass {
    func sayHi() {
        print("Hi~")
    }
}

// 4. 如果函数返回的元组有一个是私有类，则必须把方法定义成私有方法
private func someFunction() -> (InternalClass, PrivateClass) {
    // 此处是函数实现部分
    return (InternalClass(), PrivateClass())
}

// 5. 指定属性的私有setter
public struct TrackedString {
    //这样子属性就有了 private 的 setter 和 public 的 getter
    public private(set) var numberOfEdits = 0
    public var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
    
    public init() {}
}