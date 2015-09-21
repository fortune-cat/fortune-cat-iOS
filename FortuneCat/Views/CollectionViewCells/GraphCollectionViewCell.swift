//
//  GraphCollectionViewCell.swift
//  FortuneCat
//
//  Created by Kouki Saito on 2015/09/22.
//  Copyright © 2015年 FortuneCat. All rights reserved.
//

import UIKit

class GraphCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet var stackableViews: Array<UIView>!
    var positive = false {
        didSet {
            if positive {
                stackableViews.sortInPlace({$0.frame.origin.y > $1.frame.origin.y})
            } else {
                stackableViews.sortInPlace({$0.frame.origin.y < $1.frame.origin.y})
            }
        }
    }
 
    override func awakeFromNib() {
        stackableViews.sortInPlace({$0.frame.origin.y < $1.frame.origin.y})
    }
    
    func stackNum(num: Int) {
        _ = stackableViews.map({$0.hidden = true})
        for var i = 0; i < num && i < stackableViews.count; i++ {
            stackableViews[i].hidden = false
        }
    }
}
