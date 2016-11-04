//
//  HomeModel.swift
//  Swift_Base
//
//  Created by CarlChen on 2016/10/31.
//  Copyright © 2016年 CarlChen. All rights reserved.
//

import UIKit
import SwiftyJSON

class HomeModel: NSObject {
    lazy var dataArray = [HomeModelCell]()
}

extension HomeModel {
    func requestData(_ finishCallback: @escaping()->()) {
        
        let url = "\(BaseUrl)v1/channels/4/items"
        let params = ["gender":"1","generation":"1","limit":"20","offset":"0"]
        NetworkTools.requestData(.get, URLString: url, parameters: params, headers: nil) { (response) in
            
            let json = JSON(response)
            guard json["code"].intValue == 200 else {return}
            
            let data = json["candidates"].array
            
            for i in 0...data!.count - 1 {
                let obj = data![i].dictionary
                let model = HomeModelCell(dict: obj!)
                self.dataArray.append(model)
            }
            finishCallback()
        }
        
    }
}

class HomeModelCell: NSObject {
    var id = 0
    var editable = ""
    var name = ""
    init(dict:[String:Any]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forKey key: String) {
        
    }

}
