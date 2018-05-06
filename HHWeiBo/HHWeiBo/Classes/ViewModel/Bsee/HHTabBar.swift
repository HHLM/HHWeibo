//
//  HHTabBar.swift
//  HHWeiBo
//
//  Created by Mac on 2018/5/6.
//  Copyright © 2018年 Mac. All rights reserved.
//

import UIKit

class HHTabBar: UITabBar {

    var button: UIButton?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        
        let view = super.hitTest(point, with: event)
        if isHidden {
            return view
        }else {
            
            guard let btn = button else {
                return view
            }
            
            let point1 = btn.convert(point, from: self)
            
            if btn.bounds.contains(point1) {
                return btn
            }
        }
        return view
        
    }

}
