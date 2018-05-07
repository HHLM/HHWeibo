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
//        navigationBar.isHidden = false
        // Do any additional setup after loading the view.
        
    }
    
//    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
//        if viewController.childViewControllers.count > 0 {
//            viewController.hidesBottomBarWhenPushed = true
//        }
//    }

    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        
    }
}
