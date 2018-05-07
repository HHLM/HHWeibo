//
//  HHBaseNavigationController.swift
//  HHWeiBo
//
//  Created by Mac on 2018/5/4.
//  Copyright © 2018年 Mac. All rights reserved.
//

import UIKit

class HHBaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isHidden = true
//
//        let na = UINavigationBar.init(frame: CGRect.init(x: 0, y: 0, width: 440, height: 64))
//        self.view .addSubview(na)
        
    }
    
    @objc private func popToPresent() {
        popViewController(animated:true)
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            
            if let vc = viewController as? HHBaseController {
                 var title = "返回"
                if childViewControllers.count == 1 {
                    title = childViewControllers.first?.title ?? " 返回"
                }
                vc.navItem.leftBarButtonItem = UIBarButtonItem.init(title:title, target:self, action: #selector(popToPresent),isBack:true)
                
            }
        }
        super.pushViewController(viewController, animated: animated)
    }
}
