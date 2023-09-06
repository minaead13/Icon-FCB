//
//  EligibilityViewController.swift
//  icon
//
//  Created by WINMAC on 13/06/2023.
//

import UIKit
import DropDown
class EligibilityViewController: UIViewController , UITextFieldDelegate {
    
    
    @IBOutlet weak var vwResidencyStatus: UIView!
    @IBOutlet weak var percentageLbl: UILabel!
    @IBOutlet weak var EMILbl: UILabel!
    @IBOutlet weak var propertyPrice: UITextField!
    @IBOutlet weak var downPaymentTxt: UITextField!
    @IBOutlet weak var downPaymentPercentage: UIButton!
    @IBOutlet weak var interestRateTxt: UITextField!
    @IBOutlet weak var yearsLbl: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    var timer: Timer?
    let dropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downPaymentTxt.delegate = self
        propertyPrice.text = "1000000"
        downPaymentTxt.text = "200000"
        interestRateTxt.text = "3.75"
        percentageLbl.text = "40"
        
        setDropDown()
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(calcMonthly), userInfo: nil, repeats: true)
    }
    
    @objc func calcMonthly(){
        
        let r = Double(interestRateTxt.text.orEmpty).orEmpty / 100
        let P = Double(propertyPrice.text.orEmpty).orEmpty - Double(downPaymentTxt.text.orEmpty).orEmpty
        let n = Double(yearsLbl.text.orEmpty).orEmpty * 12.0
        
        EMILbl.text = String(Int((P * (r/12.0) * pow(1+(r/12.0),n)) / (pow(1+(r/12.0),n)-1)))
        percentageLbl.text = String( Double(downPaymentTxt.text.orEmpty).orEmpty / 10000 )
        print("*************************")
        print(EMILbl.text)
    }
    
    deinit {
            // Stop the timer when the view controller is deallocated
            timer?.invalidate()
        }
    
    private func setDropDown(){
        
        let percentageArray = ["5", "10" , "15", "20" , "25",
                               "30" , "35", "40", "45", "50" ,
                               "55", "60", "65", "70", "75",
                               "80", "85", "90", "95", "100"
        ]
        dropDown.anchorView = vwResidencyStatus
        dropDown.dataSource = percentageArray
                dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
                dropDown.topOffset = CGPoint(x: 0, y:-(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.selectionAction = { [unowned self]
            (index: Int, item: String) in
            self.percentageLbl.text = percentageArray[index]
            let orignalPropertyTxt = propertyPrice.text.orEmpty
            let originalPropertyValue = Double(orignalPropertyTxt).orEmpty
            
            let orignalPercentageTxt = percentageLbl.text.orEmpty
            let originalPercentageValue = Double(orignalPercentageTxt).orEmpty
            
            downPaymentTxt.text = String( Int((originalPropertyValue * originalPercentageValue) / 100 ) )
            
//            self.percentageLbl.text = String(Int( Double(downPaymentTxt.text.orEmpty).orEmpty / 10000 ))
        }
    }
    
    @IBAction func didTapDropDown(_ sender: Any) {
        dropDown.show()
    }
    
    
    @IBAction func lengthSlider(_ sender: UISlider) {
        yearsLbl.text = String(Int(sender.value))
    }
    
}
