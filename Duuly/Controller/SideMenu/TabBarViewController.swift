//
//  LoginVC.swift
//  Duuly
//
//  Created by ACoding on 11/29/17.
//  Copyright © 2017 Mobilloper. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    //MARK:- Properties
    let plusMiddleBtn = UIButton.init(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set Notification for adding center plus button on tab bar
//        NotificationCenter.default.addObserver(self, selector: #selector(self.addGrowthDataBtnToTabBar), name:NSNotification.Name(rawValue: "AddPlusBtnNotification"), object: nil)

        // Specifying selected tab bar item
        self.selectedIndex = TabBar_Index
        
        setTabBarItemTag()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK - tabbartags
    func setTabBarItemTag(){
        for index in 0...2 {
            tabBar.items?[index].tag = index
        }
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag {
        case 0:
            print(0)
        case 1:
            print(1)
        case 2:
            print(2)
        default:
            return
        }
    }
    override func viewDidLayoutSubviews() {
        // safe place to set the frame of button manually
        plusMiddleBtn.frame = CGRect.init(x: (self.tabBar.center.x) - 32, y: self.view.bounds.height - 74, width: 64, height: 64)
    }
   
    //MARK: - Specifying Notification for add button on tab bar
//    @objc func addGrowthDataBtnToTabBar() {
//        let color = UIColor.init(red: 10/255, green: 115/255, blue: 255/255, alpha: 1.0)
//        plusMiddleBtn.setTitle("+", for: .normal)
//        plusMiddleBtn.setTitleColor(color, for: .normal)
//        plusMiddleBtn.setTitleColor(color, for: .highlighted)
//        plusMiddleBtn.titleLabel?.font = UIFont.systemFont(ofSize: 40)
//
//        plusMiddleBtn.backgroundColor = .white
//        plusMiddleBtn.layer.cornerRadius = 32
//        plusMiddleBtn.layer.borderWidth = 1
//        plusMiddleBtn.layer.borderColor = color.cgColor
//        self.view.insertSubview(plusMiddleBtn, aboveSubview: (self.tabBar))
//    }
    
}
