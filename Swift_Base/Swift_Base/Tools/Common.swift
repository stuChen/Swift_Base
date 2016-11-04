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

/// 间距
let kMargin: CGFloat = 10.0
/// 圆角
let kCornerRadius: CGFloat = 5.0
/// 线宽
let klineWidth: CGFloat = 1.0
/// 首页顶部标签指示条的高度
let kIndicatorViewH: CGFloat = 2.0
/// 新特性界面图片数量
let kNewFeatureCount = 4
/// 顶部标题的高度
let kTitlesViewH: CGFloat = 35
/// 顶部标题的y
let kTitlesViewY: CGFloat = 64
/// 动画时长
let kAnimationDuration = 0.25
/// 分类界面 顶部 item 的高
let kitemH: CGFloat = 75
/// 分类界面 顶部 item 的宽
let kitemW: CGFloat = 150
/// 我的界面头部图像的高度
let kYMMineHeaderImageHeight: CGFloat = 200
// 分享按钮背景高度
let kTopViewH: CGFloat = 230



public func kAutoWidth(width:CGFloat)->CGFloat {
    //以6为标准
    return width * kScreenW / 375.0
}
public func kAutoHeight(height:CGFloat) ->CGFloat {
    //以6为标准
    return height * kScreenH / 667.0
}

public func CreateVc(VcName:String) ->UIViewController! {
    let vc = NSClassFromString("Swift_Base."+VcName) as? UIViewController.Type
    let vc1 = vc!.init()
    return vc1
}

public func RGBA(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat) ->UIColor {
    return UIColor(r: r, g: g, b: b, a: a)
}

