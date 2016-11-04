//
//  DetailViewController.swift
//  Swift_Base
//
//  Created by CarlChen on 2016/11/4.
//  Copyright © 2016年 CarlChen. All rights reserved.
//

import UIKit

class DetailViewController: BaseViewController {

    @IBOutlet weak var Cover: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.Cover.kf.setImage(with: URL(string:"http://www.5068.com/u/faceimg/20140804221801.jpg"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
