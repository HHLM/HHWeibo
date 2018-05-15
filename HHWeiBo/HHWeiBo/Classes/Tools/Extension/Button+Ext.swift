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
    
     ///带背景图的按钮
    convenience  init(imageName:String ,backImageName:String) {
        self.init()
        setImage(UIImage(named: imageName), for: .normal)
        setImage(UIImage(named: imageName+"_highlighted"), for: .highlighted)
        setBackgroundImage(UIImage(named: backImageName), for: .normal)
        setBackgroundImage(UIImage(named: backImageName+"_highlighted"), for: .highlighted)
        sizeToFit()
    }
    ///带背景图和文字的按钮
    convenience  init(title: String,color:UIColor,backImageName:String) {
        self.init()
        setTitle(title, for: .normal)
        setTitleColor(color, for: .normal)
        setBackgroundImage(UIImage(named: backImageName), for: .normal)
        
        sizeToFit()
    }
     ///带图和文字的按钮
    convenience init(title: String, fontSize: CGFloat = 16, color: UIColor, imageName: String) {
        
        self.init(title: title, color: color, backImageName: imageName)
        
        titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        
        sizeToFit()
    }
     ///带背景图和文字的按钮和点击事件
    convenience init(title:String,fontSize:CGFloat = 16,target:AnyObject?,action:Selector,isBack:Bool = false)
    {
        self.init(title: title, fontSize: 16, color: .black, imageName: "1")
        if isBack {
            setImage(UIImage(named: "cp_back"), for: .normal)
            setImage(UIImage(named: "cp_back"), for: .highlighted)
            sizeToFit()
        }
            addTarget(target, action: action, for: .touchUpInside)
        
    }
    
    
}
