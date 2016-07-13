//
//  OptionalChaining.swift
//  TEstSwift
//
//  Created by DONLINKS on 16/7/12.
//  Copyright © 2016年 Minstone. All rights reserved.
//

/**
 *  可选链式调用
 */
import Foundation

func optionalChaining() {
    
    let mk = Person()
    
    // 1. 可选链式展开
    if let roomCount = mk.residence?.numberOfRooms {
        print("mk有\(roomCount)间房")
    } else {
        print("mk没有房")
    }
    
    // 2. 可选链式设值
    let address = Address()
    address.buildingName = "合景国际金融广场"
    address.buildingNumber = "85号"
    mk.residence?.address = address //设值失败，但不会报错
    
    // 3. 通过可选链式访问方法，可以获知该方法能否访问
    //其实 void 方法会返回 () 即一个空元组
//    mk.residence = Residence()
    if mk.residence?.printNumberOfRooms() == nil {
        print("方法不能访问")
    } else {
        print(mk.residence!.printNumberOfRooms())
    }
    
    // 4. 同样原理，setter 方法返回void，可以获知赋值是否成功
    if (mk.residence?.address = address) == nil {
        print("赋值失败")
    }else{
        print(mk.residence?.address?.buildingIdentifier())
    }
    
    // 5. 通过可选链式访问下标
    if let roomName = mk.residence?[0].name {
        print(roomName)
    } else {
        print("没有该房间")
    }
    
    // 6. 通过可选链式为下标设值
    if (mk.residence?[0] = Room(name: "Kitchen")) == nil {
        print("设值失败")
    }
    
    // 7. 访问可选类型的下标
    var testScores = ["m1": [99, 100, 60], "m2": [88, 67, 99]]
    testScores["m1"]?[0] = 90
    testScores["m2"]?[0] += 2
    testScores["m3"]?[0] = 100 //由于 m3 是不存在的所以设值失败
    print(testScores)
    
    // 8. 在方法的可选返回值上进行可选链式调用
    if let beginWithThe = mk.residence?.address?.buildingIdentifier()?.hasPrefix("mk"){
        print(beginWithThe)
    }else{
        print("返回值空")
    }
}

private class Person {
    var residence: Residence?
}

private class Residence {
    var address: Address?
    
    var rooms = [Room]()
    
    var numberOfRooms: Int {
        return rooms.count
    }
    
    subscript(index: Int) -> Room {
        get {
            return rooms[index]
        }
        
        set {
            rooms[index] = newValue
        }
    }
    
    func printNumberOfRooms() {
        print("房子数量是：\(numberOfRooms)")
    }
}

private class Room {
    let name: String
    init(name _name: String){
        name = _name
    }
}

private class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    
    //返回值为可选
    func buildingIdentifier() -> String? {
        if (buildingName != nil) {
            return buildingName
        } else if buildingNumber != nil && street != nil {
            return "\(buildingNumber), \(street)"
        }else{
            return nil
        }
    }
}
