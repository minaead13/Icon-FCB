//
//  settingsViewController.swift
//  icon
//
//  Created by WINMAC on 17/06/2023.
//

import UIKit

class settingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func didTapView(_ sender: Any) {
        
        let vc = (self.storyboard?.instantiateViewController(withIdentifier: "TermsViewController") as? TermsViewController)!
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func didTapChangePassword(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "changePasswordViewController") as! changePasswordViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
