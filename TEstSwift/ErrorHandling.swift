//
//  ErrorHandling.swift
//  TEstSwift
//
//  Created by DONLINKS on 16/7/13.
//  Copyright © 2016年 Minstone. All rights reserved.
//

/**
 错误处理
 */
import Foundation

func errorHandling() {
    
    let machine = VendingMachine()
    machine.coninsDesposited = 10
    
    let gameName = "海贼王"
    
    // 1. do - catch
    do {
         try buyFavoriteSnack(gameName, vendingMachine: machine)
    } catch VendingMachineError.InvalidSelection {
        print("没有\"\(gameName)\"这游戏")
    } catch VendingMachineError.OutOfStock {
        print("\"\(gameName)\"没存货了")
    } catch VendingMachineError.InsufficientFuns(let coninsNeeded) {
        print("还需要\(coninsNeeded)元来租\"\(gameName)\"")
    } catch {
        //最后要加个 catch 才算把所有异常捕获
        print("世界末日了")
    }
    
    // 2. 将错误转换成可选值
    //如果调用中出现错误则 x=nil，否则 x=方法返回结果
    let x: ()? = try? machine.vend("不存在的游戏名")
    if x == nil {
        print("租借异常: \(x)")
    }else{
        print(x)
    }
    
    // 3. 禁用错误传递
    // 当知道调用的方法肯定不会出错时使用，如果出错会出现运行时错误
    let y: () = try! machine.vend("美国末日")
    print(y)
    
}


//自定义错误类型
enum VendingMachineError: ErrorType {
    case InvalidSelection                   //选择无效
    case InsufficientFuns(coinsNeeded: Int) //资金不足
    case OutOfStock                         //缺货
}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    
    //存货
    var gameInventory = [
        "美国末日": Item(price: 10, count: 10),
        "海贼王": Item(price: 20, count: 5),
        "刀剑神域": Item(price: 15, count: 15)
    ]
    
    //预存款
    var coninsDesposited = 0
    
    func dispenseSnack(snack: String) {
        print("租出了 \(snack)")
        print("剩余存款：\(coninsDesposited)")
        print("店内存货情况： \(gameInventory.description)")
    }
    
    //租游戏， throws 表示会抛出异常
    func vend(gameName: String) throws {
        
        //当发生 break、rerun 或者抛出异常时离开当前代码块{}前要执行的代码，常用于操作关闭流和结束上下文
        defer {
            print("抛出异常了！！！！！！！结束当前流操作");
        }
        
        //如果没有这游戏则抛出选择无效错误
        guard let game = gameInventory[gameName] else {
            throw VendingMachineError.InvalidSelection
        }
        
        guard game.count > 0 else {
            throw VendingMachineError.OutOfStock
        }
        
        guard game.price <= coninsDesposited else {
            throw VendingMachineError.InsufficientFuns(coinsNeeded: game.price - coninsDesposited)
        }
        
        coninsDesposited -= game.price
        
        var newGame = game
        newGame.count -= 1
        gameInventory[gameName] = newGame
        
        dispenseSnack(gameName)
    }
}

//如果调用 throwing 函数而不 catch，错误会延续下去
func buyFavoriteSnack(gameName: String, vendingMachine: VendingMachine) throws {
    let snackName = gameName ?? "美国末日"
    try vendingMachine.vend(snackName)
}