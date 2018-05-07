//
//  HHHomeController.swift
//  HHWeiBo
//
//  Created by Mac on 2018/5/4.
//  Copyright © 2018年 Mac. All rights reserved.
//

import UIKit

class HHHomeController: HHBaseController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navItem.leftBarButtonItem = UIBarButtonItem.init(title: "好友", target: self, action: #selector(friendListVC))
        vis.backgroundColor = UIColor.clear
        
    }
    
    @objc private func friendListVC() {
        let vc = HHBaseController()
        navigationController?.pushViewController(vc, animated: true)
    }

}
