//
//  ContactViewController.swift
//  icon
//
//  Created by WINMAC on 18/06/2023.
//

import UIKit

class ContactViewController: UIViewController {
    
    @IBOutlet weak var messageTxtView: UITextView!
    
    let placeholder = "Enter Message"
    override func viewDidLoad() {
        super.viewDidLoad()
        messageTxtView.delegate = self
        messageTxtView.textColor = .white
        messageTxtView.text = placeholder
        messageTxtView.returnKeyType = .done

        }
    

   

}

extension ContactViewController : UITextViewDelegate {
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
