//
//  SepetTableViewCell.swift
//  FoodApp
//
//  Created by Azra Kaya on 28.05.2022.
//

import UIKit

class SepetTableViewCell: UITableViewCell {

    @IBOutlet weak var sepetHucreArkaplan: UIView!
    
    @IBOutlet weak var sepetYemekAdLabel: UILabel!
    
    @IBOutlet weak var sepetImageView: UIImageView!
    
    @IBOutlet weak var sepetAdetLabel: UILabel!
    
    @IBOutlet weak var sepetFiyatLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
