//
//  HHTabBarController.swift
//  HHWeiBo
//
//  Created by Mac on 2018/5/4.
//  Copyright © 2018年 Mac. All rights reserved.
//

import UIKit

class HHTabBarController: UITabBarController,UITabBarControllerDelegate {

    
    lazy var hh_tabBar: HHTabBar = HHTabBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupController()
        
        setupComposedButton()
        
        self.delegate = self
        
        self.selectedIndex  = 0
        
        //print(Bundle.main.infoDictionary ?? "")
    }
    
    
    /*
        -：使用代码控制设置方向 ：好处在需要横屏的时候，单独处理
        -：设置支持的方向之后，当前的控制器及其子控制器都会遵守这个方向
        -：如果视频方向用模态展示
     */
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    /// objc 保证方法私有，仅在当前对象被访问
    /// 允许这个函数在运行时通过OC的消息机制被调用
    @objc private func clickComposedButton() {
        print("点我了")
        let alert = UIAlertController.init(title: "哈哈", message: "点的中间的按钮", preferredStyle: UIAlertControllerStyle.alert)
        
        let cancelAction = UIAlertAction.init(title: "取消", style: UIAlertActionStyle.cancel) { cancelAction in
            print("取消了")
        }
        let sureAction = UIAlertAction.init(title: "确定", style: UIAlertActionStyle.destructive) { sureAction in
            print("")
        }
        alert.addAction(cancelAction)
        alert.addAction(sureAction)
        
        
        present(alert, animated: true) {
            
        }
        
    }
    
    // MARK: - 懒加载控件
    private  lazy var customButton = UIButton(imageName: "tabbar_compose_icon_add", backImageName: "tabbar_compose_button")
    
    
    /// 设置撰写按钮
    private func setupComposedButton() {
        // 1. 添加按钮
        hh_tabBar.addSubview(customButton)
        
        hh_tabBar.button = customButton
        // 2. 调整按钮
        let count = childViewControllers.count
        // 让按钮宽一点点，能够解决手指触摸的容错问题 //tabBar两个按钮之间会有容错点
        let w = tabBar.bounds.width / CGFloat(count) - 1
        //水平向里面缩
        customButton.frame = tabBar.bounds.insetBy(dx: 2*w, dy: 0)
        
        hh_tabBar.bringSubview(toFront: customButton)
        
        // 3. 添加监听方法
        customButton.addTarget(self, action: #selector(clickComposedButton), for: .touchUpInside)
    }
    
    
    private func setupController() {
        let info = [
            ["className":"HHHomeController","title":"首页","image":"tabbar_home","sImageName":"tabbar_home"],
            ["className":"HHDiscoverController","title":"发现","image":"tabbar_discover","sImageName":"tabbar_discover"],
            ["className":"UIViewController"], //只是为了添加view
            ["className":"HHMessageController","title":"消息","image":"tabbar_message_center","sImageName":"tabbar_message_center"],
            ["className":"HHAdminController","title":"我的","image":"tabbar_profile","sImageName":"tabbar_profile"],
            ]
        
        var array = [HHBaseNavigationController]()
        
        for dict in info {
            array.append(setChildViewController(dict))
        }
    
        //一定要放到 添加子控制器前面
        setValue(hh_tabBar, forKey: "tabBar")
        
        viewControllers = array
        
        //tabbar不透明
//        hh_tabBar.isTranslucent = false
        //未选中字体的颜色
        hh_tabBar.unselectedItemTintColor = UIColor.darkGray
        //选中字体颜色
        hh_tabBar.tintColor = UIColor.red
        //tabbar染色
        hh_tabBar.barTintColor = UIColor.white
        
       
        
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
        
        let vc:HHBaseController = cla.init()
        
        
        print(vc)
        
        let nav = HHBaseNavigationController(rootViewController: vc)
        
        vc.title = title;
        
        
        nav.tabBarItem.image = UIImage.init(named: image)?.withRenderingMode(.alwaysOriginal)
        
        nav.tabBarItem.selectedImage = UIImage(named: image+"_highlighted")?.withRenderingMode(.alwaysOriginal)
        
        let font = UIFont.systemFont(ofSize: 12)
        
        let color = UIColor.darkGray
        
        let selectColor = UIColor.red
        
        //设置字体大小和默认颜色 选中颜色
        nav.tabBarItem.setTitleTextAttributes([NSAttributedStringKey(rawValue: NSAttributedStringKey.font.rawValue) : font,NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue):color], for: UIControlState.normal)
        
        nav.tabBarItem.setTitleTextAttributes([NSAttributedStringKey(rawValue: NSAttributedStringKey.font.rawValue) : font, NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue):selectColor], for: UIControlState.selected)
    
        return nav
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let index = tabBarController.viewControllers?.index(of: viewController)
        
        if index == 2 {
            return false
        }
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
