//
//  ViewController.swift
//  FortuneCat
//
//  Created by Kouki Saito on 2015/09/16.
//  Copyright © 2015年 FortuneCat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var moneyLabel: MoneyLabel!
    
    let negativeColor = UIColor(red: 255/255, green: 135/255, blue: 23/255, alpha: 1)
    let positiveColor = UIColor(red: 88/255, green: 158/255, blue: 255/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func income(sender: UIButton) {
        moneyLabel.money += Int(rand() % 10000)
        changeBackgroundColor(moneyLabel.money)
    }
    @IBAction func expense(sender: UIButton) {
        moneyLabel.money -= Int(rand() % 10000)
        changeBackgroundColor(moneyLabel.money)
    }
    
    func changeBackgroundColor(money: Int) {
        UIView.animateWithDuration(0.5, animations: {
            [unowned self] in
            if money >= 0 {
                self.view.backgroundColor = self.positiveColor
            } else {
                self.view.backgroundColor = self.negativeColor
            }
        })
    }

}

