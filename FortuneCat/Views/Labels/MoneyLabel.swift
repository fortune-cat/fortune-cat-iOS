//
//  MoneyLabel.swift
//  FortuneCat
//
//  Created by Kouki Saito on 2015/09/16.
//  Copyright © 2015年 FortuneCat. All rights reserved.
//

import UIKit

class MoneyLabel: UILabel {
    var money: Int = 0 {
        didSet {
            showMoneyWithAnimation()
        }
    }
    private var animatingMoney = 0
    private var timer: NSTimer?
    
    override func awakeFromNib() {
        self.text = makeMoneyText(money)
    }
    
    
    func showMoneyWithAnimation() {
        guard money != 0 else {
            self.text = makeMoneyText(0)
            return
        }
        animatingMoney = Int(rand()) % Int(pow(10.0, Double(moneyDigit()-1)))

        timer?.invalidate()
        timer = NSTimer.scheduledTimerWithTimeInterval(3/60, target: self, selector: Selector("animateMoney"), userInfo: nil, repeats: true)
    }
    
    func animateMoney() {
        let digit = moneyDigit()
        if money >= 0 {
            self.text = makeMoneyText(animatingMoney, digit: digit)
        } else {
            self.text = makeMoneyText(-animatingMoney, digit: digit)
        }
        
        for var n = digit-1; n >= 0; n-- {
            let exp = Int(pow(10.0, Double(n)))
            
            if abs(animatingMoney) / exp != abs(money) / exp {
                if animatingMoney / (exp*10) == (animatingMoney + exp) / (exp*10) {
                    // not carry-over
                    animatingMoney += exp
                } else {
                    animatingMoney -= exp*9
                }
                
                for var i = n-1; i >= 0; i-- {
                    let exp = Int(pow(10.0, Double(i)))
                    if animatingMoney / (exp*10) == (animatingMoney + exp) / (exp*10) {
                        animatingMoney += exp
                    } else {
                        animatingMoney -= exp*9
                    }
                }
                return
            }
        }

        timer?.invalidate()
        timer = nil
    }
    
    func makeMoneyText(money: Int, digit: Int = 0) -> String{
        let currency = "¥"
        var moneyText = ""
        
        if money < 0 {
            moneyText += "-"
        } else {
            moneyText += ""
        }
        
        moneyText += "\(currency) "
        
        moneyText += NSString(format: "%0\(digit)d", abs(money)) as String
        
        return moneyText
    }
    
    private func moneyDigit() -> Int {
        return "\(abs(money))".characters.count
    }

}
