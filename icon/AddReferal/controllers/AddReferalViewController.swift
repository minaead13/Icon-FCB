//
//  AddReferalViewController.swift
//  icon
//
//  Created by WINMAC on 17/06/2023.
//

import UIKit
import DropDown

class AddReferalViewController: UIViewController {
    
    
    @IBOutlet weak var selectServiceTxt: UITextField!
    @IBOutlet weak var selectOutlet: UIButton!
    
    let dropDown = DropDown()
    var isActive : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        setDropDown()
        
    }
    
    private func setDropDown(){

        let serviceArray = ["Credit Cards", "Personal Loans" , "Mortgage Loans", "Business Loans", "Debt Consolidation", "Bank accounts", "Underwriting", "Other" ]
        dropDown.anchorView = selectServiceTxt
        dropDown.dataSource = serviceArray
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.topOffset = CGPoint(x: 0, y:-(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.selectionAction = { [unowned self]
            (index: Int, item: String) in
            self.selectServiceTxt.text = serviceArray[index]
        }
        
        
    }
    
    @IBAction func didTapSelectService(_ sender: Any) {
        dropDown.show()
    }
    
    @IBAction func didTapSelect(_ sender: Any) {
        
        if isActive {
            isActive = false
            selectOutlet.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        }
         else {
             isActive = true
            selectOutlet.setImage(UIImage(systemName: "square"), for: .normal)
            }
        }
    
    }
    


