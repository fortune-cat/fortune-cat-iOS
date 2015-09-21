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
    
    @IBOutlet weak var graphCollectionView: UICollectionView!
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
                self.view.backgroundColor = UIColor.positiveColor()
            } else {
                self.view.backgroundColor = UIColor.negativeColor()
            }
        })
    }

}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell: GraphCollectionViewCell?
        if indexPath.row % 2 == 0 {
            cell = collectionView.dequeueReusableCellWithReuseIdentifier("negativeGraph", forIndexPath: indexPath) as? GraphCollectionViewCell
            cell?.positive = false
        } else {
            cell = collectionView.dequeueReusableCellWithReuseIdentifier("positiveGraph", forIndexPath: indexPath) as? GraphCollectionViewCell
            cell?.positive = true
        }
        cell?.stackNum(indexPath.row/2)
        return cell!
    }
}
