//
//  Enumerations.swift
//  TEstSwift
//
//  Created by DONLINKS on 16/6/3.
//  Copyright © 2016年 Minstone. All rights reserved.
//

import Foundation

enum enums: String{
    case EnumType1 = "abc"
    case EnumType2 = "def"
    case EnumType3 = "ghi"
}


enum Barcode{
    case UPCA(numberSystem: Int, manufacturer: Int, product: Int, check: Int)
    case QRCode(productCode: String)
}

enum Planet: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

func enumeration(){
    
    var enumVal = enums.EnumType1
    enumVal = .EnumType2
    print("\(enumVal.rawValue)")
    
    //元组型枚举
    var productBarcode = Barcode.UPCA(numberSystem: 8, manufacturer: 85909, product: 51226, check: 3)
    codeInfo(productBarcode)
    productBarcode = .QRCode(productCode: "ABCDEFGHIJKLMNOP")
    codeInfo(productBarcode)
    
    //使用原始值初始化枚举实例
    let possiblePlanet = Planet(rawValue: 7)
    print("\(possiblePlanet!)")
}

func codeInfo(code: Barcode){
    switch code {
    case let .UPCA(numberSystem, manufacturer, product, check):
        print("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")
    case let .QRCode(productCode):
        print("QR code: \(productCode).")
    }
}