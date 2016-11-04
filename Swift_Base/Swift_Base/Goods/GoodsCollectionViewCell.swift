//
//  GoodsCollectionViewCell.swift
//  Swift_Base
//
//  Created by CarlChen on 2016/11/1.
//  Copyright © 2016年 CarlChen. All rights reserved.
//

import UIKit
import Kingfisher

class GoodsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var pic: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var love: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor(r: 230, g: 230, b: 230, a: 1).cgColor
        self.layer.borderWidth = 0.5
    }
    
    
    public func configUI(model:GoodsModel) {
        self.pic.kf.setImage(with: URL(string:model.cover_image_url!))
        
        self.name.text = model.name
        self.price.text = model.price
        self.love.text = "\(model.favorites_count)"
    }
}
