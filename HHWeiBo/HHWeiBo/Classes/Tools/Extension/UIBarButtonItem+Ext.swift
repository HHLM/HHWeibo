//
//  UIBarButtonItem+Ext.swift
//  HHWeiBo
//
//  Created by Mac on 2018/5/7.
//  Copyright © 2018年 Mac. All rights reserved.
//

import Foundation
import UIKit

extension UIBarButtonItem {
    convenience init(title:String,imageName:String) {
        
        let btn = UIButton.init(title: title, color: .darkGray, imageName: "")
        self.init(customView: btn)
        
    }
}
