//
//  GoodsModel.swift
//  Swift_Base
//
//  Created by CarlChen on 2016/11/1.
//  Copyright © 2016年 CarlChen. All rights reserved.
//

import UIKit

class GoodsModel: NSObject {
    
    //var description: String?

    var editor_id: Int = 0

    var url: String?

    var purchase_url: String?

    var image_urls: [String]?

    var is_favorite: Bool = false

    var updated_at: Int = 0

    var purchase_type: Int = 0

    var brand_id: String?

    var name: String?

    var post_ids: [String]?

    var purchase_status: Int = 0

    var favorites_count: Int = 0

    var id: Int = 0

    var purchase_id: String?

    var brand_order: Int = 0

    var subcategory_id: String?

    var created_at: Int = 0

    var price: String?

    var category_id: String?

    var cover_image_url: String?
    
    init(dict : [String : Any]) {
        super.init()
        
//        for
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    override func setNilValueForKey(_ key: String) {
        print("\(key) is nil value")
        var cs = self.value(forKey: key)
        if ((cs as? Int) != nil) {
            cs = 0
        }
        else if (cs as? String) != nil {
            cs = ""
        }
    }
}
