//
//  swift
//  Swift_Base
//
//  Created by CarlChen on 2016/10/27.
//  Copyright © 2016年 CarlChen. All rights reserved.
//

import UIKit

extension UIImage {
    /**
    根据颜色和尺寸生成一张图片
    
    - parameter color: 颜色
    - parameter size:  尺寸
    
    - returns: 图片
    */
    class func imageWithColor(color: UIColor, size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(CGSize(width:size.width, height:size.height), true, UIScreen.main.scale)
        color.set()
        UIRectFill(CGRect(x:0, y:0, width:size.width, height:size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
extension UIImage {
    func imageByApplyingAlpha(_ alpha: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, 0)
        
        let ctx = UIGraphicsGetCurrentContext()
        let area = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        
        ctx?.scaleBy(x: 1, y: -1)
        ctx?.translateBy(x: 0, y: -area.size.height)
        
        ctx?.setBlendMode(.multiply)
        
        ctx?.setAlpha(alpha)
        
        ctx?.draw(self.cgImage!, in: area)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    
    func imageInRect(_ rect: CGRect) -> UIImage {
        let sourceImageRef = self.cgImage
        let newImageRef = sourceImageRef?.cropping(to: rect)
        return UIImage(cgImage: newImageRef!)
    }
    
    func clipImage(_ size: CGSize) -> UIImage {
        if self.size.width*size.height <= self.size.height*size.width {
            //以被剪裁图片的宽度为基准，得到剪切范围的大小
            let width  = self.size.width
            let height = self.size.width * size.height / size.width
            
            return self.imageInRect(CGRect(x: 0, y: (self.size.height - height)*0.5, width: width, height: height))
        } else {
            // 以被剪切图片的高度为基准，得到剪切范围的大小
            let width  = self.size.height * size.width / size.height
            let height = self.size.height
            return self.imageInRect(CGRect(x: (self.size.width - width) * 0.5, y: 0, width: width, height: height))
        }
    }
}


