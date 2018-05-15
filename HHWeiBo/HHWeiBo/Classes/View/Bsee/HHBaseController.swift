//
//  HHBaseController.swift
//  HHWeiBo
//
//  Created by Mac on 2018/5/4.
//  Copyright © 2018年 Mac. All rights reserved.
//

import UIKit

//Swift类似于多继承 OC不支持多继承 用协议替代
class HHBaseController: UIViewController {

    //控制导航颜色
    lazy var navgationView:UIVisualEffectView = UIVisualEffectView.init(frame: CGRect.init(x: 0, y: 0, width: kWidth, height: 64))
    //自定义导航条
    lazy var navgationBar = UINavigationBar(frame: CGRect(x: 0, y:20, width: kWidth, height: 44))
    
    lazy var navItem =  UINavigationItem()
    
    //表格
    var tableView:UITableView?
    //刷新控件
    var refershControl : UIRefreshControl?
    //区分上拉刷新标记
    var isPull:Bool = false
    
    //用户登录状态
    var userLogon = true
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        loadData()
        
    }
    
    @objc private func back(){
        let vc = HHBaseController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: 数据加载 - 具体有子类负责实现
    @objc func loadData()  {
        //不实现方法 就默认关闭
        refershControl?.endRefreshing()
    }
    
    //MARK:重写 设置title方法
    override var title: String? {
        didSet {
            navItem.title = title
        }
    }
}
// MARK: -设置界面
extension HHBaseController {
    //不能写属性 不能重写父类，重写是子类的 扩展是对类的扩展
    
    func setupUI() {
        view.backgroundColor = UIColor.cyan
        setNavgaitionBar()
        
        userLogon ? setDefaultView() : setupTableView()
    }
    
    private func setupTableView() {
        tableView = UITableView.init(frame: view.bounds, style: .plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        if #available(iOS 11.0, *) {
            tableView?.contentInsetAdjustmentBehavior = .never
        } else {
            // Fallback on earlier versions
            automaticallyAdjustsScrollViewInsets = true
        }
        tableView?.contentInset = UIEdgeInsetsMake(navgationView.bounds.height, 0, tabBarController?.tabBar.bounds.height ?? 49, 0)
        view.addSubview(tableView!)
        view.insertSubview(tableView!, belowSubview: navgationView)
        tableView?.tableFooterView = UIView()
        //cell线条长度
        tableView?.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        
        ///添加刷新控件
        refershControl = UIRefreshControl()
        tableView?.addSubview(refershControl!)
        refershControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
        
    }
    private func setDefaultView() {
        let defaultView = UIView.init(frame: view.bounds)
        defaultView.backgroundColor = .green
        view.addSubview(defaultView)
        view.insertSubview(defaultView, belowSubview: navgationView)
    }
    
    private func setNavgaitionBar() {
        
        view.addSubview(navgationView)
        view.addSubview(navgationBar)
        navgationBar.sendSubview(toBack: navgationBar)
        navgationBar.items = [navItem]
        
        //设置导航的字体大小和颜色
        navgationBar.titleTextAttributes = [NSAttributedStringKey(rawValue: NSAttributedStringKey.font.rawValue):UIFont.systemFont(ofSize: 18),
                                            NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue):UIColor.black];
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
}
//MARK: - 数据
extension HHBaseController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    //基类只准备方法 子类负责具体实现
    //子类的数据源调用不需要 super 只保证语法正确
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // 1、判断是不是最后一行
        // 2、row
        let hh_row = indexPath.row
        let hh_section = tableView.numberOfSections - 1
        DLog("\(hh_section)")
        
        if hh_row < 0 || hh_section < 0 {
            return
        }
        let hh_count = tableView.numberOfRows(inSection: hh_section)
        
        if hh_row == (hh_count - 1) && !isPull  {
            DLog("上拉刷新")
            isPull = true
            //开始刷新
            loadData()
        }
        
    }
    
}


