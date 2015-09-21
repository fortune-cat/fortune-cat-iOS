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
    }
    @IBAction func expense(sender: UIButton) {
        moneyLabel.money -= Int(rand() % 10000)
    }
    
}

