//
//  InputTransactionViewController.swift
//  FortuneCat
//
//  Created by Kouki Saito on 2015/09/22.
//  Copyright © 2015年 FortuneCat. All rights reserved.
//

import UIKit

let kMoneyAdded = "MoneyAdded"

class InputTransactionViewController: UIViewController {
    var isIncome = true

    @IBOutlet weak var moneyInputField: UITextField! {
        didSet {
            moneyInputField.becomeFirstResponder()
            moneyInputField.text = "¥0"
        }
    }
    @IBOutlet weak var noteInputField: UITextField!
    var money: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if MoneyManager.sharedInstance.isPositive() {
            self.view.backgroundColor = UIColor.positiveColor()
        } else {
            self.view.backgroundColor = UIColor.positiveColor()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func moneyChanged(sender: UITextField) {
        if let text = moneyInputField.text where text.characters.count > 0{
            guard let money = Int(
                    text.substringFromIndex(text.startIndex.advancedBy(1))
                        .stringByReplacingOccurrencesOfString(",", withString: "")
                ) else {
                    moneyInputField.text = "¥0"
                return
            }
            self.money = money
            let num = NSNumber(integer: money)
            let formatter = NSNumberFormatter()
            formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
            formatter.groupingSeparator = ","
            formatter.groupingSize = 3
            
            let formattedMoney = formatter.stringFromNumber(num)!

            sender.text = "¥\(formattedMoney)"
        } else {
            moneyInputField.text = "¥0"
        }
    }

    @IBAction func done(sender: UIBarButtonItem) {
        self.view.endEditing(true)
        self.dismissViewControllerAnimated(true, completion: nil)
        
        guard let money = self.money else {
            return
        }
        
        if isIncome {
            NSNotificationCenter.defaultCenter().postNotificationName(kMoneyAdded, object: self, userInfo: [
                "money": money
            ])
        } else {
            NSNotificationCenter.defaultCenter().postNotificationName(kMoneyAdded, object: self, userInfo: [
                "money": -money
            ])
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
