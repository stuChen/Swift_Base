//
//  BaseTabbarViewController.swift
//  Swift_Base
//
//  Created by CarlChen on 2016/10/28.
//  Copyright © 2016年 CarlChen. All rights reserved.
//

import UIKit

class BaseTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let nav1 = BaseNavigationViewController(rootViewController: CreateVc(VcName: "IndexViewController"))
        let nav2 = BaseNavigationViewController(rootViewController: CreateVc(VcName: "HomeViewController"))
        let nav3 = BaseNavigationViewController(rootViewController: CreateVc(VcName: "GoodsViewController"))
        
        nav1.tabBarItem = UITabBarItem(title: "首页", image: nil, selectedImage: nil)
        nav2.tabBarItem = UITabBarItem(title: "网页", image: nil, selectedImage: nil)
        nav3.tabBarItem = UITabBarItem(title: "单品", image: nil, selectedImage: nil)
        viewControllers = [nav1,nav2,nav3]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
