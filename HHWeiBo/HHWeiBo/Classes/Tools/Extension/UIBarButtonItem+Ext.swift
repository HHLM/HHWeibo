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
    ///带图片的barItem
    convenience init(title:String,target:AnyObject?,action:Selector,isBack:Bool = false) {
        let btn = UIButton(title: title, target: target, action: action,isBack:isBack)
        self.init(customView: btn)
    }
}
