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
    lazy var navgationView:UIVisualEffectView = UIVisualEffectView.init(frame: CGRect.init(x: 0, y: 0, width: kWidth, height: 64))
    lazy var navItem =  UINavigationItem()
//
    @objc private func back(){
        let vc = HHBaseController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.cyan
        
        view.addSubview(navgationView)
        view.addSubview(navgationBar)
        navgationBar.sendSubview(toBack: navgationBar)
        navgationBar.items = [navItem]
        
        //设置导航的字体大小和颜色
        navgationBar.titleTextAttributes = [NSAttributedStringKey(rawValue: NSAttributedStringKey.font.rawValue):UIFont.systemFont(ofSize: 18),
                                            NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue):UIColor.orange];
        //让自定义导航栏透明
        navgationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        //去掉自定义导航的那根线
        navgationBar.shadowImage = UIImage()
        //设置导航的颜色
        navgationView.backgroundColor = kColorRandom()
        //设置导航条的透明度
        navgationView.alpha = 1.0
        navItem.rightBarButtonItem = UIBarButtonItem.init(title: "下一页", target: self, action: #selector(back))
        //设置导航上item的字体颜色
        navgationBar.barTintColor = UIColor.orange
        navgationBar.tintColor = UIColor.red
        navItem.leftBarButtonItem?.setTitleTextAttributes([NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue):UIColor.white], for: .normal)
    }
    
    //重写
    override var title: String? {
        didSet {
            navItem.title = title
        }
    }
}
