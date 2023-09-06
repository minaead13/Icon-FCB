//
//  ApplyViewController.swift
//  icon
//
//  Created by WINMAC on 04/07/2023.
//

import UIKit

class ApplyViewController: UIViewController {

    
    @IBOutlet weak var facilityAndLentgthView: UIStackView!
    @IBOutlet weak var noteView: UITextView!
    
    @IBOutlet weak var pleasSelectView: UIView!
    
    
    @IBOutlet weak var requestLimitView: UIView!
    
    @IBOutlet weak var notesTextView: UITextView!
    
    
    let placeholder = "Notes"
    var servicesID : Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        selectId()
    }
    
    private func configure(){
        notesTextView.delegate = self
        notesTextView.textColor = .gray
        notesTextView.text = placeholder
        notesTextView.returnKeyType = .done
    }
    
    func selectId(){
        if servicesID == 1 {
            bank()
        } else if servicesID == 2 {
            credit()
        } else if servicesID == 3 || servicesID == 4 || servicesID == 5 {
            loans()
        } else {
            conMethod()
        }
    }
    
    private func loans(){
        pleasSelectView.isHidden = true
        requestLimitView.isHidden = true
        noteView.isHidden = true
        facilityAndLentgthView.isHidden = false
    }
    
    private func conMethod(){
        pleasSelectView.isHidden = true
        requestLimitView.isHidden = true
        noteView.isHidden = false
        facilityAndLentgthView.isHidden = true
    }
    
    private func bank(){
        pleasSelectView.isHidden = false
        requestLimitView.isHidden = true
        noteView.isHidden = true
        facilityAndLentgthView.isHidden = true
    }
    
    private func credit(){
        pleasSelectView.isHidden = true
        requestLimitView.isHidden = false
        noteView.isHidden = true
        facilityAndLentgthView.isHidden = true
    }
    
    
    

    
}
extension ApplyViewController : UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == placeholder {
            textView.text = ""
            textView.textColor = .white
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
        }
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = placeholder
            textView.textColor = .white
        }
    }
}
