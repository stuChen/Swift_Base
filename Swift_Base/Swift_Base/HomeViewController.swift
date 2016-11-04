//
//  HomeViewController.swift
//  Swift_Base
//
//  Created by CarlChen on 2016/10/27.
//  Copyright © 2016年 CarlChen. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    fileprivate lazy var activity:UIActivityIndicatorView = {
        let act = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        act.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        return act
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "asdasdsa"
        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = false
        self.automaticallyAdjustsScrollViewInsets = false
        
        
        let web = UIWebView(frame: CGRect(x: 0, y: 64, width: kScreenW, height: kScreenH - 64))
        web.loadRequest(URLRequest(url: URL(string: "http://1.wodede.applinzi.com/")!))
        web.delegate = self
        view.addSubview(web)
        
        activity.hidesWhenStopped = true
        view.addSubview(activity)
    }

    
}


extension HomeViewController:UIWebViewDelegate {
    
    
    
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print(error)
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        activity.startAnimating()
        return true
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        activity.stopAnimating()
    }
}
