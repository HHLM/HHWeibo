//
//  Button+Ext.swift
//  HHWeiBo
//
//  Created by Mac on 2018/5/6.
//  Copyright © 2018年 Mac. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    
    convenience  init(imageName:String ,backImageName:String) {
        self.init()
        setImage(UIImage(named: imageName), for: .normal)
        setImage(UIImage(named: imageName+"_highlighted"), for: .highlighted)
        setBackgroundImage(UIImage(named: backImageName), for: .normal)
        setBackgroundImage(UIImage(named: backImageName+"_highlighted"), for: .highlighted)
        sizeToFit()
    }
    convenience  init(title: String,color:UIColor,backImageName:String) {
        self.init()
        setTitle(title, for: .normal)
        setTitleColor(color, for: .normal)
        setBackgroundImage(UIImage(named: backImageName), for: .normal)
        
        sizeToFit()
    }
    convenience init(title: String, fontSize: CGFloat, color: UIColor, imageName: String) {
        
        self.init(title: title, color: color, backImageName: imageName)
        
        titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        
        sizeToFit()
    }
    
    
    open override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        if view == nil {
            for sub in self.subviews {
                let point1 = sub.convert(point, from: self)
                
                if sub.bounds.contains(point1) {
                    return sub
                }
            }
        }
        return view
        
    }
    
    
}