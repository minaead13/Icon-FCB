//
//  OurServicesCollectionViewCell.swift
//  icon
//
//  Created by WINMAC on 12/06/2023.
//

import UIKit
import Kingfisher
class OurServicesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var serviceImage: UIImageView!
    @IBOutlet weak var serviceLbl: UILabel!
        
    func setUp(services: iconData ){
        serviceLbl.text = services.name
        serviceImage.kf.setImage(with: services.image.asUrl)
    }

}

