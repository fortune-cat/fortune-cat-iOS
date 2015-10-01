//
//  TalkLabel.swift
//  FortuneCat
//
//  Created by Kouki Saito on 9/30/15.
//  Copyright © 2015 FortuneCat. All rights reserved.
//

import UIKit

class TalkLabel: UILabel {
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func initView() {
        let gesture = UITapGestureRecognizer(target: self, action: "tapped:")
        self.addGestureRecognizer(gesture)
    }
    
    
    func talk() {
        
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
