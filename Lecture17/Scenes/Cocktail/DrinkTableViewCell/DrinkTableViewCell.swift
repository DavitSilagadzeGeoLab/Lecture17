//
//  DrinkTableViewCell.swift
//  Lecture17
//
//  Created by LiziChichua on 12.01.25.
//

import UIKit
import Kingfisher

class DrinkTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var drinkImageView: UIImageView!
    @IBOutlet private weak var drinkNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        drinkImageView.layer.cornerRadius = drinkImageView.layer.bounds.width / 2
    }
    
    func configure(with drink: Drink) {
        let url = URL(string: drink.imageUrl)
        drinkImageView.kf.indicatorType = .activity
        drinkImageView.kf.setImage(with: url)
        drinkNameLabel.text = drink.name
    }
}
