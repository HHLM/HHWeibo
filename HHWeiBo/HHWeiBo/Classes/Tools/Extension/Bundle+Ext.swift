//
//  Bundle+Ext.swift
//  HHWeiBo
//
//  Created by Mac on 2018/5/4.
//  Copyright © 2018年 Mac. All rights reserved.
//

import Foundation

extension Bundle {

    var namespace:String {
        
    
        //？ 有才执行 没有不执行
        let name = Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
        return name
    }
    
    
}
