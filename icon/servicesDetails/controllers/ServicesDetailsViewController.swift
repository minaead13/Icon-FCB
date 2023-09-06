//
//  ServicesDetailsViewController.swift
//  icon
//
//  Created by WINMAC on 20/06/2023.
//

import UIKit
import KRProgressHUD
import Alamofire
class ServicesDetailsViewController: UIViewController {

    @IBOutlet weak var detailsImg : UIImageView!
    @IBOutlet weak var detailsLbl : UILabel!
    @IBOutlet weak var nameLbl : UILabel!
    @IBOutlet weak var reviewsLbl : UILabel!
    
    var servicesId : iconData?
    var serviceDetails : iconData?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
    }
    
    func setData(){
        detailsLbl.text = servicesId?.details
        nameLbl.text = servicesId?.name
        detailsImg.kf.setImage(with: servicesId?.image.asUrl)
    }
    
    
    @IBAction func didTapApply(_ sender: Any) {
        let alert = UIAlertController(title: "Book this service?", message: "Sure you want to book this service", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes book", style: .default){(_) in
            
            let second = UIAlertController(title: "Good Job", message: "Your request has been sent successfully we will call you as soon as possible", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Done", style: .default){(_) in
                let vc = (self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController)!
                self.navigationController?.pushViewController(vc, animated: true)
            }
            second.addAction(okAction)
            self.present(second, animated: true)
            
        })
        present(alert, animated: true)
    }
    
}



