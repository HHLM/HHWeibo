//
//  HHTabBarController.swift
//  HHWeiBo
//
//  Created by Mac on 2018/5/4.
//  Copyright © 2018年 Mac. All rights reserved.
//

import UIKit

class HHTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
       setupController()
        
//        print(Bundle.main.infoDictionary ?? "")
    }
    
    private func setupController() {
        let info = [
            ["className":"HHHomeController","title":"首页","image":"tabbar_home","sImageName":"tabbar_home"],
            ["className":"HHDiscoverController","title":"发现","image":"tabbar_discover","sImageName":"tabbar_discover"],
            ["className":"HHMessageController","title":"消息","image":"tabbar_message_center","sImageName":"tabbar_message_center"],
            ["className":"HHAdminController","title":"我的","image":"tabbar_profile","sImageName":"tabbar_profile"],
            ]
        
        var array = [HHBaseNavigationController]()
        
        for dict in info {
            array.append(setChildViewController(dict))
        }
    
        viewControllers = array
    }
    
    private func setChildViewController(_ dict : [String:String]) -> HHBaseNavigationController {
        
        guard let className = dict["className"],
                let title = dict["title"],
                let image = dict["image"],
//                let selectImage = dict["sImageName"],
                let cla = NSClassFromString(Bundle.main.namespace + "." + className) as? HHBaseController.Type
            else {
                return HHBaseNavigationController.init(rootViewController: UIViewController())
        }
        
        let vc = cla.init()
        
        
        print(vc)
        
        let nav = HHBaseNavigationController.init(rootViewController: vc)
        
        vc.title = title;
        
        nav.tabBarItem.image = UIImage.init(named: image)?.withRenderingMode(.alwaysOriginal)
        nav.tabBarItem.selectedImage = UIImage(named: image+"_highlighted")?.withRenderingMode(.alwaysOriginal)
        
        return nav
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
