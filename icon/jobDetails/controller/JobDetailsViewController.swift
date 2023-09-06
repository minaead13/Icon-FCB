//
//  JobDetailsViewController.swift
//  icon
//
//  Created by WINMAC on 18/06/2023.
//

import UIKit

class JobDetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func didtTapApplyBtn(_ sender: Any) {
        let vc = (self.storyboard?.instantiateViewController(withIdentifier: "ApplyForJobViewController") as? ApplyForJobViewController)!
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    

}
