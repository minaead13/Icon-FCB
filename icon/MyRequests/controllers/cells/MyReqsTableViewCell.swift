//
//  MyReqsTableViewCell.swift
//  icon
//
//  Created by WINMAC on 05/07/2023.
//

import UIKit

class MyReqsTableViewCell: UITableViewCell {

    @IBOutlet weak var reqImage: UIImageView!
    @IBOutlet weak var reqId: UILabel!
    @IBOutlet weak var reqNameLbl: UILabel!
    @IBOutlet weak var stateLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    func setUp(model : MyRequests) {
        reqId.text = "ML\(model.id)"
        reqNameLbl.text = model.service.name
        stateLbl.text = model.status
        dateLbl.text = model.createdAt
        reqImage.kf.setImage(with: model.service.image.asUrl)
    }
    
}
