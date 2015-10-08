//
//  CategorySelectViewController.swift
//  FortuneCat
//
//  Created by Kouki Saito on 2015/09/22.
//  Copyright © 2015年 FortuneCat. All rights reserved.
//

import UIKit

class CategorySelectViewController: UIViewController {
    var isIncome: Bool = true

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
    

    @IBAction func cancelButtonTapped(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as? InputTransactionViewController
        destination?.isIncome = isIncome
    }

}
extension CategorySelectViewController: UICollectionViewDelegate {
    
}

extension CategorySelectViewController: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Item", forIndexPath: indexPath)
        return cell
    }
}