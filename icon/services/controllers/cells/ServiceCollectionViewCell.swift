//
//  ServiceCollectionViewCell.swift
//  icon
//
//  Created by WINMAC on 11/06/2023.
//

import UIKit

class ServiceCollectionViewCell: UICollectionViewCell {

   
    @IBOutlet weak var serviceImage: UIImageView!
    @IBOutlet weak var ServiceLbl: UILabel!
    
    func configure(_ service: ServiceModel){
        serviceImage.image = service.image
        self.serviceImage.makeCircular()
        ServiceLbl.text = service.title
    }
}
