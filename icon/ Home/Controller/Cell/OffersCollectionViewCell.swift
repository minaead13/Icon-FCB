//
//  OffersCollectionViewCell.swift
//  icon
//
//  Created by WINMAC on 12/06/2023.
//

import UIKit
import Kingfisher
class OffersCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var offersImage: UIImageView!
    @IBOutlet weak var offersLbl: UILabel!
    
    
    func setUp(offers: iconData ){
        offersLbl.text = offers.name
        offersImage.kf.setImage(with: offers.image.asUrl)
    }

}
