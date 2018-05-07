//
//  HHBaseController.swift
//  HHWeiBo
//
//  Created by Mac on 2018/5/4.
//  Copyright © 2018年 Mac. All rights reserved.
//

import UIKit

class HHBaseController: UIViewController {

    lazy var navgationBar = UINavigationBar(frame: CGRect(x: 0, y:0, width: 440, height: 64))
    
    lazy var navItem =  UINavigationItem()
//
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = kColorRandom()
//        view.addSubview(navgationBar)
//        navgationBar.barTintColor = UIColor.red
//        navgationBar.layer.backgroundColor = UIColor.blue.cgColor
//        print(navgationBar,navgationBar)
//
//        navgationBar.items = [navItem,navItem]
        
//        self.navigationController?.navigationBar.layer.backgroundColor = UIColor.red.cgColor
    }
    
    //重写
    override var title: String? {
        didSet {
            navItem.title = title
        }
    }
}
