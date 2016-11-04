//
//  GoodsViewController.swift
//  Swift_Base
//
//  Created by CarlChen on 2016/11/1.
//  Copyright © 2016年 CarlChen. All rights reserved.
//

import UIKit
import SwiftyJSON
import Presentr

class GoodsViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let cellId = "collectionViewCellId"
    lazy var GoodsDataArray = [GoodsModel]()
    let presenter: Presentr = {
        let presenter = Presentr(presentationType: .alert)
        presenter.transitionType = .coverVerticalFromTop // Optional
        presenter.dismissTransitionType = .coverVertical
        return presenter
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.register(UINib(nibName: "GoodsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellId)
        //创建layout
        let layout = UICollectionViewFlowLayout()
        let width = kScreenW / 2 - 15
        layout.itemSize = CGSize(width: width, height: width * 3 / 2)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collectionView.collectionViewLayout = layout
        
    
        
        loadCollectionData()
    }

    func loadCollectionData()  {
        
        NetworkTools.requestData(.get, URLString: "http://api.dantangapp.com/v2/items?gender=1&generation=1&limit=20&offset=0", parameters: nil, headers: nil) { (response) in
            let json = JSON(response)
            guard json["code"].intValue == 200 else {return}
            
            guard let items = json["data"]["items"].arrayObject else {return}
            guard ((items as? [[String:Any]]) != nil) else {return}
            
            for datas in items as! [[String:Any]] {
                let data = datas["data"] as? [String:Any]
                self.GoodsDataArray.append(GoodsModel(dict: data!))
            }
            self.collectionView.reloadData()
        }
    }

}

extension GoodsViewController:UICollectionViewDelegate,UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return GoodsDataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! GoodsCollectionViewCell
        cell.configUI(model:self.GoodsDataArray[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let title = "Are you sure?"
//        let body = "There is no way to go back after you do this!"
//        
//        let controller = Presentr.alertViewController(title: title, body: body)
//        
//        let deleteAction = AlertAction(title: "Sure 🕶", style: .destructive) {
//            print("Deleted!")
//        }
//        
//        let okAction = AlertAction(title: "NO, sorry 🙄", style: .cancel){
//            print("Ok!")
//        }
//        
//        controller.addAction(deleteAction)
//        controller.addAction(okAction)
//        
//        presenter.presentationType = .alert
//        customPresentViewController(presenter, viewController: controller, animated: true, completion: nil)
        let vc = DetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
