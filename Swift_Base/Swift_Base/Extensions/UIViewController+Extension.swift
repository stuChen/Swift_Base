//
//  swift
//  Swift_Base
//
//  Created by CarlChen on 2016/10/27.
//  Copyright © 2016年 CarlChen. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showProgress () {
        let progressView = UIActivityIndicatorView()
        progressView.activityIndicatorViewStyle = .gray
        progressView.hidesWhenStopped = true
        progressView.tag = 500
        self.view.addSubview(progressView)
        
        progressView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        progressView.center = self.view.center
        
        progressView.startAnimating()
    }
    
    func hiddenProgress() {
        for view in self.view.subviews {
            if view.tag == 500 {
                let indicatorView : UIActivityIndicatorView = view as! UIActivityIndicatorView
                indicatorView.stopAnimating()
                indicatorView.removeFromSuperview()
            }
        }
    }
}
