//
//  YemeklerTableViewCell.swift
//  FoodApp
//
//  Created by Azra Kaya on 26.05.2022.
//

import UIKit

class YemeklerTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var yemekResimImageView: UIImageView!
    
    @IBOutlet weak var yemekAdLabel: UILabel!
    
    @IBOutlet weak var yemekFiyatLabel: UILabel!
    
    @IBOutlet weak var hucreArkaplan: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
