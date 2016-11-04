//
//  IndexModel.swift
//  Swift_Base
//
//  Created by CarlChen on 2016/10/28.
//  Copyright © 2016年 CarlChen. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class IndexModel: NSObject {

    lazy var dataArray = [IndexModelCell]()
}

extension IndexModel {
    //请求数据
    func requestData(_ finishCallback : @escaping()->()) {
        
        //        let headers: HTTPHeaders = [
        //            "apikey": "0820495a181d75238373a5f328e879ae",
        //            ]
        
        let url = "\(BaseUrl)v2/channels/preset"
        let params = ["gender":"1","generation":"1"]
        NetworkTools.requestData(.get, URLString: url, parameters: params, headers: nil) { (response) in
            
            let json = JSON(response)
            guard json["code"].intValue == 200 else {return}
            
            let data = json["data"]["candidates"].arrayObject

            for obj in data! {
                let model = IndexModelCell(dict: obj as! [String : Any])
                self.dataArray.append(model)
            }
            finishCallback()
        }
    }
}


class IndexModelCell: NSObject {
    var id = 0
    var editable = false
    var name = ""
    init(dict : [String : Any]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
}
