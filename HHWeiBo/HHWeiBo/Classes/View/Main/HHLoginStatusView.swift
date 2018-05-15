//
//  HHLoginStatusView.swift
//  HHWeiBo
//
//  Created by Mac on 2018/5/15.
//  Copyright © 2018年 Mac. All rights reserved.
//

import UIKit

class HHLoginStatusView: UIView {

    
    /// 注册按钮
    lazy var registerButton: UIButton = UIButton(title: "注册",
                                                 color: UIColor.orange,
                                                 backImageName: "common_button_white_disable")
    /// 登录按钮
    lazy var loginButton: UIButton = UIButton(title: "登录",
                                              color: UIColor.darkGray,
                                              backImageName: "common_button_white_disable")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///背景
    fileprivate lazy  var iconView:UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    ///房子
    fileprivate lazy var houseView:UIImageView = UIImageView(image: UIImage.init(named: "visitordiscover_feed_image_house"))
    ///展示信息
    fileprivate lazy var infoLab:UILabel = UILabel(tilte: "关注一些人，你会看到不一样的内容！！", titleColor: .red)
    
}

extension HHLoginStatusView {
    func setupUI() {
        backgroundColor = UIColor.white
        
        //1、添加控件
        addSubview(iconView)
        addSubview(houseView)
        addSubview(infoLab)
        infoLab.textAlignment = .center
        addSubview(registerButton)
        addSubview(loginButton)
        
        //2、取消autoresizing
        for v in subviews {
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        
        //3、自动布局
        
        addConstraint(NSLayoutConstraint.init(item: iconView,
                                              attribute: .centerX,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .centerX,
                                              multiplier: 1.0,
                                              constant: 0))
        
        addConstraint(NSLayoutConstraint.init(item: iconView,
                                              attribute: .centerY,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .centerY,
                                              multiplier: 1.0,
                                              constant: -40))
        
        addConstraint(NSLayoutConstraint.init(item: houseView,
                                              attribute: .centerX,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .centerX,
                                              multiplier: 1.0,
                                              constant: 0))
        
        addConstraint(NSLayoutConstraint.init(item: houseView,
                                              attribute: .centerY,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .centerY,
                                              multiplier: 1.0,
                                              constant: -40))
        
        addConstraint(NSLayoutConstraint.init(item: infoLab,
                                              attribute: .centerX,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .centerX,
                                              multiplier: 1.0,
                                              constant: 0))
        
        addConstraint(NSLayoutConstraint.init(item: infoLab,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: iconView,
                                              attribute: .bottom,
                                              multiplier: 1.0,
                                              constant: 20))
        
        addConstraint(NSLayoutConstraint.init(item: registerButton,
                                              attribute: .centerX,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .centerX,
                                              multiplier: 1.0,
                                              constant: 100))
        
        addConstraint(NSLayoutConstraint.init(item: registerButton,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: infoLab,
                                              attribute: .bottom,
                                              multiplier: 1.0,
                                              constant: 30))
        
        
        addConstraint(NSLayoutConstraint.init(item: registerButton,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: nil,
                                              attribute: .notAnAttribute,
                                              multiplier: 1.0,
                                              constant: 100))
        
        addConstraint(NSLayoutConstraint.init(item: loginButton,
                                              attribute: .centerX,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .centerX,
                                              multiplier: 1.0,
                                              constant: -100))
        
        addConstraint(NSLayoutConstraint.init(item: loginButton,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: infoLab,
                                              attribute: .bottom,
                                              multiplier: 1.0,
                                              constant: 30))
        
        addConstraint(NSLayoutConstraint.init(item: loginButton,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: registerButton,
                                              attribute: .width,
                                              multiplier: 1.0,
                                              constant: 0))
    }
}

