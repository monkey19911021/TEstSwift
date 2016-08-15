//
//  SingleInstance.swift
//  TEstSwift
//
//  Created by DONLINKS on 16/8/11.
//  Copyright © 2016年 Minstone. All rights reserved.
//

import Foundation

func singleInstance() {
    let m1 = MKInstance.sharedInstance
    let m2 = MKInstance.sharedInstance
    
    m1.count = 100
    
    m1.sayHi()
    m2.sayHi()
}


//普通单例方法做法
class MKInstance  {
    var count = 0
    
    private init() {}
    static let sharedInstance = MKInstance()
    
    init(count: Int) {
        self.count = count
    }
    
    func sayHi() {
        print("\(count), \(MKInstance.self)")
    }
}

