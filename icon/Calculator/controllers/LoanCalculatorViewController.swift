//
//  LoanCalculatorViewController.swift
//  icon
//
//  Created by WINMAC on 13/06/2023.
//

import UIKit

class LoanCalculatorViewController: UIViewController {
    
    
    @IBOutlet weak var LoansConatinerView: UIView!
    @IBOutlet weak var EligibiltyContainerView: UIView!
    
    
    let egligbilityVC = EligibilityViewController()
    let loansVC = LoansViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        EligibiltyContainerView.isHidden = false
        LoansConatinerView.isHidden = true
        
        
    }
    
   
    
    @IBAction func didTapSegment( segment: UISegmentedControl) {
        
         if segment.selectedSegmentIndex == 0 {
            EligibiltyContainerView.isHidden = false
            LoansConatinerView.isHidden = true
          
        } else {
            LoansConatinerView.isHidden = false
            EligibiltyContainerView.isHidden = true

        }
        
    }

    

}


