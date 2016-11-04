//
//  swift
//  Swift_Base
//
//  Created by CarlChen on 2016/10/27.
//  Copyright © 2016年 CarlChen. All rights reserved.
//

import UIKit

extension UIColor {
    
    // MARK:- 遍历构造器
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat,a:CGFloat) {
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
    
    // MARK:- 随机色
    class func randomColor() -> UIColor {
        return UIColor(r: CGFloat(arc4random_uniform(256)), g: CGFloat(arc4random_uniform(256)), b: CGFloat(arc4random_uniform(256)),a:1)
    }
}
