//
//  swift
//  Swift_Base
//
//  Created by CarlChen on 2016/10/27.
//  Copyright © 2016年 CarlChen. All rights reserved.
//

import UIKit

let kStatusBarH : CGFloat = 20
let kNavigationBarH : CGFloat = 44
let kTabbarH : CGFloat = 44

let kScreenW = UIScreen.main.bounds.size.width
let kScreenH = UIScreen.main.bounds.size.height


public func kAutoWidth(width:CGFloat)->CGFloat {
    //以6为标准
    return width * kScreenW / 375.0
}
public func kAutoHeight(height:CGFloat) ->CGFloat {
    //以6为标准
    return height * kScreenH / 667.0
}
