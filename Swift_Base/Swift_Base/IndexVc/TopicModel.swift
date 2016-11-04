//
//  TopicModel.swift
//  Swift_Base
//
//  Created by CarlChen on 2016/10/31.
//  Copyright © 2016年 CarlChen. All rights reserved.
//

import UIKit
import SwiftyJSON

class TopicModel: NSObject {
    lazy var dataArray = [TopicModelCell]()
}
extension TopicModel {
    /// 获取首页数据
    func loadHomeInfo(id: Int, finished:@escaping (_ homeItems: [TopicModelCell]) -> ()) {
        
        //        let headers: HTTPHeaders = [
        //            "apikey": "0820495a181d75238373a5f328e879ae",
        //            ]
        
        let url = BaseUrl + "v1/channels/\(id)/items"
        let params = ["gender": 1,
                      "generation": 1,
                      "limit": 20,
                      "offset": 0]
        
        NetworkTools.requestData(.get, URLString: url, parameters: params, headers: nil) { (response) in
            
            
            let json = JSON(response)
            guard json["code"].intValue == 200 else {return}
            
            let data = json["data"]["items"].arrayObject
            
            for obj in data! {
                let model = TopicModelCell(dict: obj as! [String : Any])
                self.dataArray.append(model)
            }
            finished(self.dataArray)
        }
    }
}


class TopicModelCell: NSObject {
    var id = 0
//    var editor_id = 0
    var cover_image_url = ""
    var content_url = ""
    var share_msg = ""
    var short_title = ""
    var template = ""
    var title = ""
    var type = ""
    var url = ""
    var liked = false
    var likes_count = 0
    var published_at = 0
    var created_at = 0
    var status = 0
    var updated_at = 0
    
    init(dict : [String : Any]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
}
