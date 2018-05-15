//
//  HHHomeController.swift
//  HHWeiBo
//
//  Created by Mac on 2018/5/4.
//  Copyright © 2018年 Mac. All rights reserved.
//

import UIKit


//定义全局常量，尽量用private
private let cellId = "cellId"

class HHHomeController: HHBaseController {
    
    

    private lazy var dataArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navItem.leftBarButtonItem = UIBarButtonItem.init(title: "好友", target: self, action: #selector(friendListVC))
        navgationView.backgroundColor = UIColor.orange
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        let loginView = HHLoginStatusView.init(frame: view.bounds)
        view.addSubview(loginView)
        
    }
 
    override func loadData() {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            for i in 0..<5 {
                //数据插入顶部
                if self.isPull {
                    self.dataArray.append("上拉\(i)")
                }else {
                    self.dataArray.insert(i.description, at: 0)
                }
            }
            self.tableView?.reloadData()
            self.refershControl?.endRefreshing()
            self.isPull = false
        }
        
        
    }

    @objc private func friendListVC() {
        let vc = HHBaseController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
// MARK -- 数据源方法
extension HHHomeController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row]
        return cell;
    }
}

extension HHHomeController {
    
}
