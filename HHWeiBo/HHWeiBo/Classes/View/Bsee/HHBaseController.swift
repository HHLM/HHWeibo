//
//  HHBaseController.swift
//  HHWeiBo
//
//  Created by Mac on 2018/5/4.
//  Copyright © 2018年 Mac. All rights reserved.
//

import UIKit

class HHBaseController: UIViewController {

    lazy var navgationBar = UINavigationBar(frame: CGRect(x: 0, y:20, width: kWidth, height: 44))
    lazy var vis:UIVisualEffectView = UIVisualEffectView.init(frame: CGRect.init(x: 0, y: 0, width: kWidth, height: 64))
    lazy var navItem =  UINavigationItem()
//
    @objc private func back(){
        let vc = HHBaseController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = kColorRandom()
        
        view.addSubview(vis)
        view.addSubview(navgationBar)
        navgationBar.sendSubview(toBack: navgationBar)
        navgationBar.items = [navItem]
        //让自定义导航栏透明
        navgationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        //去掉自定义导航的那根线
        navgationBar.shadowImage = UIImage()
        vis.backgroundColor = kColorRandom()
        vis.alpha = 1.0
//        navItem.rightBarButtonItem = UIBarButtonItem.init(title: "返回", target: self, action: #selector(back))
        navItem.rightBarButtonItem = UIBarButtonItem.init(title: "下一页", target: self, action: #selector(back))
        print(navgationBar.subviews)
    }
    
    //重写
    override var title: String? {
        didSet {
            navItem.title = title
        }
    }
}
