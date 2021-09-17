//
//  CarTableViewCell.swift
//  FavCars
//
//  Created by Sriharsha on 15/08/21.
//

import UIKit

class CarTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var numberLable: UILabel!
    @IBOutlet weak var backLable: UILabel!
    
    @IBOutlet weak var carImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        titleLable.layer.cornerRadius = 10
        titleLable.layer.borderColor = UIColor.darkGray.cgColor
        titleLable.layer.borderWidth = 3
        titleLable.clipsToBounds = true
        
        numberLable.layer.cornerRadius = 17.5
        numberLable.layer.borderColor = UIColor.black.cgColor
        numberLable.layer.borderWidth = 3
        numberLable.clipsToBounds = true
        
        backLable.layer.cornerRadius = 10
        backLable.layer.borderColor = UIColor.darkGray.cgColor
        backLable.layer.borderWidth = 3
        backLable.clipsToBounds = true
        
        carImgView.layer.cornerRadius = 10
        carImgView.clipsToBounds = true
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
