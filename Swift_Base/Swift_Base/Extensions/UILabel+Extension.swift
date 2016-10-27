//
//  swift
//  Swift_Base
//
//  Created by CarlChen on 2016/10/27.
//  Copyright © 2016年 CarlChen. All rights reserved.
//

import UIKit

extension UILabel {

    class func setAttributText(_ content: String?, lineSpcae: CGFloat) -> NSAttributedString {
        let attrs = NSMutableAttributedString(string: content!)
        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.lineSpacing = lineSpcae
        paragraphStyle.firstLineHeadIndent    = 0.0;
        paragraphStyle.hyphenationFactor      = 0.0;
        paragraphStyle.paragraphSpacingBefore = 0.0;
        
        attrs.addAttribute(NSParagraphStyleAttributeName,
                           value: paragraphStyle,
                           range: NSMakeRange(0, (content!.characters.count)))
        
        return attrs
    }
    
}
