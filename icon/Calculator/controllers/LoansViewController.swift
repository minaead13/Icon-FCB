//
//  LoansViewController.swift
//  icon
//
//  Created by WINMAC on 13/06/2023.
//

import UIKit

class LoansViewController: UIViewController {
    @IBOutlet weak var monthlyInstallmentLbl: UILabel!
    @IBOutlet weak var propertyPriceTxt: UITextField!
    @IBOutlet weak var interestTxt: UITextField!
    @IBOutlet weak var yearsLbl: UILabel!
    
    var timer: Timer?
    
    override func viewDidLoad() {
        propertyPriceTxt.text = "1000000"
        interestTxt.text = "3.75"
        yearsLbl.text = "1"
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(calcMonthly), userInfo: nil, repeats: true)
    }
    
    @objc func calcMonthly(){
        let originalInterestRate = interestTxt.text.orEmpty
        let originalInterestValue = Double(originalInterestRate).orEmpty / 100.0
        
        let originalyears = yearsLbl.text.orEmpty
        let originalyearsValue = Double(originalyears).orEmpty
        
        let originalLoanAmount = propertyPriceTxt.text.orEmpty
        let originalLoanValue = Double(originalLoanAmount).orEmpty
        
        let result = originalLoanValue * ((originalInterestValue * originalyearsValue ) / 100)
        
        let finalPrice = result / ( originalyearsValue * 12)
        
        monthlyInstallmentLbl.text = String(Int(finalPrice))
        
    }
    
    deinit {
            // Stop the timer when the view controller is deallocated
            timer?.invalidate()
        }

    
    @IBAction func lengthSlider(_ sender: UISlider) {
        yearsLbl.text = String(Int(sender.value))
    }
    
}
