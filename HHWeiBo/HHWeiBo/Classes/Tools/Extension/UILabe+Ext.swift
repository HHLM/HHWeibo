//
//  UILabe+Ext.swift
//  HHWeiBo
//
//  Created by Mac on 2018/5/15.
//  Copyright © 2018年 Mac. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    convenience init(tilte:String,fontSize:CGFloat = 16,titleColor:UIColor) {
        self.init()
        text = tilte
        textColor = titleColor
        font = UIFont.systemFont(ofSize: fontSize)
        sizeToFit()
    }
}
