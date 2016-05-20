//
//  StringAndCharacter.swift
//  TEstSwift
//
//  Created by DONLINKS on 16/5/20.
//  Copyright © 2016年 Minstone. All rights reserved.
//

import Foundation

func StringAndCharachter(){
    
    //MARK: Unicode 标量
    //Unicode 标量是对应字符或者修饰符的唯一的21位数字，例如U+0061表示小写的拉丁字母(LATIN SMALL LETTER A)("a")
    //注意： Unicode 码位(code poing) 的范围是U+0000到U+D7FF或者U+E000到U+10FFFF。Unicode 标量不包括 Unicode 代理项(surrogate pair) 码位，其码位范围是U+D800到U+DFFF
    
    //MARK: 字符串字面量的特殊字符
    //转义字符\0(空字符)、\\(反斜线)、\t(水平制表符)、\n(换行符)、\r(回车符)、\"(双引号)、\'(单引号)。
    //Unicode 标量，写成\u{n}(u为小写)，其中n为任意一到八位十六进制数且可用的 Unicode 位码。
    
    
    //MARK: 字符串索引
    let greeting = "Guten Tag!"
    greeting[greeting.startIndex] //第一个Character的索引
    // G
    greeting[greeting.endIndex.predecessor()] //最后一个Character的后一个位置的索引的前面一个索引
    // !
    greeting[greeting.startIndex.successor()] //后面一个索引
    // u
    let greetingIndex = greeting.startIndex.advancedBy(7)
    greeting[greetingIndex]
    // a
    
    //indices属性会创建一个包含全部索引的范围(Range)
    for index in greeting.characters.indices {
        print("\(greeting[index]) ", terminator: ", ")
    }
    // 打印输出 "G u t e n   T a g ! "
}