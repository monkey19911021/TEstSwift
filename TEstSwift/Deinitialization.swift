//
//  Deinitialization.swift
//  TEstSwift
//
//  Created by DONLINKS on 16/7/11.
//  Copyright © 2016年 Minstone. All rights reserved.
//

/**
 *  析构过程
 */

import Foundation

func deinitialization(){
    
    var mk: MKClass? = MKClass()
    mk!.description()
    
    mk = nil
    
}

private class MKClass{
    
    func description(){
        print("MKClass")
    }
    
    deinit{
        print("执行析构过程")
    }
}