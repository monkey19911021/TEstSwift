//
//  自定义原型.swift
//  TEstSwift
//
//  Created by DONLINKS on 16/8/10.
//  Copyright © 2016年 Minstone. All rights reserved.
//

import Foundation

func 自定义原型() {
    
    let isSuccess: MKBool = true
    
    if isSuccess {
        print("来访问我的博客：http://mkapple.cn ")
    }
}

enum MKBool {
    case mkTrue
    case mkFalse
}

// 实现 BooleanLiteralConvertible 协议，让 MKBool 可以赋值 true 或者 false
extension MKBool: BooleanLiteralConvertible {
    init() {
        self = .mkFalse
    }
    
    internal init(booleanLiteral value: Bool) {
        self = value ? mkTrue : mkFalse
    }
}

// 实现 BooleanType 协议，让 MKBool 可以获取 true 或者 false 值
extension MKBool: BooleanType{
    internal var boolValue: Bool {
        return self == .mkTrue
    }
}