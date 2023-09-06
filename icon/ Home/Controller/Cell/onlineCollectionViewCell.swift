//
//  onlineCollectionViewCell.swift
//  icon
//
//  Created by WINMAC on 11/06/2023.
//

import UIKit
import Kingfisher
class onlineCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var onlineImage: UIImageView!
    
    func setUp(online: adsData ){
        onlineImage.kf.setImage(with: online.image.asUrl)
    }
}
