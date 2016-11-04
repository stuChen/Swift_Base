//
//  TopicTableViewController.swift
//  Swift_Base
//
//  Created by CarlChen on 2016/10/31.
//  Copyright © 2016年 CarlChen. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher

let homeCellID = "homeCellID"

class TopicTableViewController: UITableViewController {

    var type = Int()
    var currentBanner = 0
    let topicM = TopicModel()
    lazy var bannerModels = [bannerModel]()
    
    /// 首页列表数据
    var items = [TopicModelCell]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        tableView.backgroundColor = GlobalBackColor
        let refresh = UIRefreshControl.init()
        refresh.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        self.refreshControl = refresh
        setupTableView()
        LoadHeaderViewData()
        self.refreshData()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setupTableView() {
        tableView.rowHeight = 160
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsetsMake(kTitlesViewY + kTitlesViewH, 0, tabBarController!.tabBar.height, 0)
        tableView.scrollIndicatorInsets = tableView.contentInset
        let nib = UINib(nibName: "YMHomeCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: homeCellID)
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 80))
        tableView.tableHeaderView = nil
        tableView.tableHeaderView = headerView
        
    }
    
    func setupHeaderView(arr:[bannerModel]) {
        
        let headerView = tableView.tableHeaderView

        let model     = arr[0] as bannerModel

        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: headerView!.height))
        imageView.kf.setImage(with: URL(string: model.image_url!))
        headerView!.addSubview(imageView)
        
        let swip = UIPanGestureRecognizer(target: self, action: #selector(swipClicl(swip:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(swip)
        
    }
    var stop = false
    func swipClicl(swip:UIPanGestureRecognizer)  {
        
        
        
        if swip.state == .began {
            stop = true
        }
        else if swip.state == .changed {
            let translation = swip.translation(in: swip.view)

            //向左划
            if translation.x < -10 {
                if stop {
                    
                    currentBanner += 1
                    if currentBanner >= self.bannerModels.count {currentBanner = 0}
                    let imageView = swip.view as! UIImageView
                    UIView.transition(with: imageView, duration: 1, options: .transitionFlipFromRight, animations: { 
                        imageView.kf.setImage(with: URL(string: self.bannerModels[self.currentBanner].image_url!))
                        }, completion: { (success) in
                            
                    })
                }
                
                
            }
            //向右划
            if translation.x > 10 {
                if stop {
                    currentBanner -= 1
                    if currentBanner < 0 {currentBanner = self.bannerModels.count - 1}
                    
                    let imageView = swip.view as! UIImageView
                    UIView.transition(with: imageView, duration: 1, options: .transitionFlipFromLeft, animations: {
                        imageView.kf.setImage(with: URL(string: self.bannerModels[self.currentBanner].image_url!))
                        }, completion: { (success) in
                            
                    })
                }
            }
            stop = false
        }
        else {
            stop = false
        }
    }
    
    func LoadHeaderViewData() {
        
        let url = BaseUrl + "v1/banners"
        
        NetworkTools.requestData(.get, URLString: url, parameters: ["channel":"iOS"], headers: nil) { (response) in
            let json = JSON(response)
            guard json["code"].intValue == 200 else {return}
            
            guard let banners = json["data"]["banners"].arrayObject else {return}
            
    
            for obj in banners {
                let model = bannerModel(dict: obj as! [String : Any])
                self.bannerModels.append(model)
            }
            self.setupHeaderView(arr: self.bannerModels)
        }
    }
    
    
    
    func refreshData() {
        
        self.refreshControl?.beginRefreshing()
        
        topicM.loadHomeInfo(id: type) { [weak self](dataArr) in
            self!.items = dataArr
            self!.tableView.reloadData()
            self!.refreshControl?.endRefreshing()
        }
    }
}
extension TopicTableViewController:YMHomeCellDelegate{


    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeCell = tableView.dequeueReusableCell(withIdentifier: homeCellID) as! YMHomeCell
        homeCell.selectionStyle = .none
        homeCell.homeItem = items[indexPath.row]
        homeCell.delegate = self
        return homeCell
    }
    
    // MARK: - YMHomeCellDelegate
    func homeCellDidClickedFavoriteButton(button: UIButton) {


    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


class bannerModel: NSObject {
    
    var status: Int = 0

    var channel: String?

    var target: Target?

    var id: Int = 0

    var image_url: String?

    var order: Int = 0

    var target_url: String?

    var type: String?

    var target_id: Int = 0
    
    init(dict : [String : Any]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
}
class Target: NSObject {

    var status: Int = 0

    var banner_image_url: String?

    var subtitle: String?

    var id: Int = 0

    var created_at: Int = 0

    var title: String?

    var cover_image_url: String?

    var updated_at: Int = 0

    var posts_count: Int = 0
    
    init(dict : [String : Any]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
}

