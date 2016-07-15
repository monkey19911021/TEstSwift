//
//  NestedTypes.swift
//  TEstSwift
//
//  Created by DONLINKS on 16/7/15.
//  Copyright © 2016年 Minstone. All rights reserved.
//

/**
 嵌套类型
 */
import Foundation

func nestedTypes() {
    let blackjack = BlackjackCard(rank: .Ace, suit: .Spades)
    print(blackjack.description)
    
    //引用类型嵌套
    let char = BlackjackCard.Suit.Hearts.rawValue
    print("\(char)")
}

struct BlackjackCard {
    // 嵌套的 Suit 枚举
    enum Suit: Character {
        case Spades = "♠", Hearts = "♡", Diamonds = "♢", Clubs = "♣"
    }
    
    // 嵌套的 Rank 枚举
    enum Rank: Int {
        case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten
        case Jack, Queen, King, Ace
        struct Values {
            let first: Int, second: Int?
        }
        var values: Values {
            switch self {
            case .Ace:
                return Values(first: 1, second: 11)
            case .Jack, .Queen, .King:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    
    // BlackjackCard 的属性和方法
    let rank: Rank, suit: Suit
    var description: String {
        var output = "花色为 \(suit.rawValue),"
        output += " 值为 \(rank.values.first)"
        if let second = rank.values.second {
            output += " 或者 \(second)"
        }
        return output
    }
}