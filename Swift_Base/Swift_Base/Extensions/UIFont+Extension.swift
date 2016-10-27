//
//  swift
//  Swift_Base
//
//  Created by CarlChen on 2016/10/27.
//  Copyright © 2016年 CarlChen. All rights reserved.
//
import UIKit

extension UIFont {
    /**
     自定义字体
     */
    class func customFont_DINPro(fontSize size : CGFloat) -> UIFont {
        return UIFont(name: "DINPro", size: size)!
    }
    
    /**
     自定义字体 -- 粗体
     */
    class func customFont_FZLTZCHJW(fontSize size : CGFloat) -> UIFont {
        return UIFont(name: "FZLanTingHeiS-DB1-GB", size: size)!
    }
    
    /**
     自定义字体 - 细体
     */
    class func customFont_FZLTXIHJW(fontSize size : CGFloat) -> UIFont {
        return UIFont(name: "FZLanTingHeiS-L-GB", size: size)!
    }
}
