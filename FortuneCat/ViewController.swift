//
//  ViewController.swift
//  FortuneCat
//
//  Created by Kouki Saito on 2015/09/16.
//  Copyright © 2015年 FortuneCat. All rights reserved.
//

import UIKit
import Crashlytics

class ViewController: UIViewController {

    enum SegueIdentifier: String {
        case Income
        case Expense
    }
    
    @IBOutlet weak var moneyLabel: MoneyLabel!
    
    @IBOutlet weak var graphCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NSNotificationCenter.defaultCenter().addObserverForName(kMoneyAdded, object: nil, queue: nil, usingBlock: {
            [unowned self] (notification: NSNotification) in
            guard let money = notification.userInfo?["money"] as? Int else {
                return
            }
            
            self.moneyLabel.money += money
            self.changeBackgroundColor(self.moneyLabel.money)
            })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func income(sender: UIButton) {
    }
    @IBAction func expense(sender: UIButton) {
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let identifier = segue.identifier, segueIdentifier = SegueIdentifier(rawValue: identifier) else {
            return
        }
        
        let destinationNavigation = segue.destinationViewController as? UINavigationController
        let destinationController = destinationNavigation?.viewControllers.first as? CategorySelectViewController
        
        switch segueIdentifier {
        case .Income:
            destinationController?.isIncome = true
        case .Expense:
            destinationController?.isIncome = false
        }
        
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
