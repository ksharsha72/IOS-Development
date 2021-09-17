//
//  CustomButton.swift
//  WorkOutGuide
//
//  Created by Sriharsha on 13/08/21.
//

import UIKit

class CustomButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
//        self.backgroundColor = UIColor(red: 0.87, green: 0.53, blue: 0.50, alpha: 1.00)
        
        self.backgroundColor = appColor

        self.setTitleColor(UIColor.white, for: .normal)
        
        self.titleLabel?.textColor = UIColor.white
        self.titleLabel?.font = UIFont(name: buttonFont, size:20 )
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
