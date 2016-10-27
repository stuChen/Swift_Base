//
//  swift
//  Swift_Base
//
//  Created by CarlChen on 2016/10/27.
//  Copyright © 2016年 CarlChen. All rights reserved.
//

import Foundation

extension String {
    /// 获取字符串长度
    var length : Int {
        return characters.count
    }
    
    /**
     获得符合正则表达式的字符串集合
     - parameter pattern: 正则表达式
     - returns: 字符串集合
     */
    func getSuitableString(_ pattern: String) -> [String]{
        
        do {
            let pattern = pattern
            let regex   = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
            let res     = regex.matches(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.characters.count))
            var subStrArray = [String]()
            for checkingRes in res {
                let subStr = (self as NSString).substring(with: checkingRes.range)
                subStrArray.append(subStr)
            }
            return subStrArray
        }
        catch {
            print(error)
        }
        
        return [String]()
    }
}
