//
//  BaseNavigationViewController.swift
//  Swift_Base
//
//  Created by CarlChen on 2016/10/27.
//  Copyright © 2016年 CarlChen. All rights reserved.
//

import UIKit

class BaseNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = mainColor
        navBar.tintColor = UIColor.white
        navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont.systemFont(ofSize: 20)]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
