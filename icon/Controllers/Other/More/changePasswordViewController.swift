//
//  changePasswordViewController.swift
//  icon
//
//  Created by WINMAC on 17/06/2023.
//

import UIKit

class changePasswordViewController: UIViewController {
    var iconClc = false
    let imageIcon = UIImageView()
    
    var iconClc2 = false
    let imageIcon2 = UIImageView()
    
    var iconClc3 = false
    let imageIcon3 = UIImageView()
    
    @IBOutlet weak var oldPasswordTxt: UITextField!
    @IBOutlet weak var newPasswordTxt: UITextField!
    @IBOutlet weak var confirmPasswordTxt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        securePassword()
    }
    

    private func securePassword() {
        
        imageIcon.image = UIImage(systemName: "eye.slash")
        let content = UIView()
        
        content.addSubview(imageIcon)
        content.frame = CGRect(x: 0, y: 0, width: Int(UIImage(systemName: "eye.slash")!.size.width), height: Int(UIImage(systemName: "eye.slash")!.size.height))
        imageIcon.frame = CGRect(x: -10, y: 0, width: Int(UIImage(systemName: "eye.slash")!.size.width), height: Int(UIImage(systemName: "eye.slash")!.size.height))
        
        imageIcon2.image = UIImage(systemName: "eye.slash")
        let content2 = UIView()
        
        content2.addSubview(imageIcon2)
        content2.frame = CGRect(x: 0, y: 0, width: Int(UIImage(systemName: "eye.slash")!.size.width), height: Int(UIImage(systemName: "eye.slash")!.size.height))
        imageIcon2.frame = CGRect(x: -10, y: 0, width: Int(UIImage(systemName: "eye.slash")!.size.width), height: Int(UIImage(systemName: "eye.slash")!.size.height))
        
        
        imageIcon3.image = UIImage(systemName: "eye.slash")
        let content3 = UIView()
        
        content3.addSubview(imageIcon3)
        content3.frame = CGRect(x: 0, y: 0, width: Int(UIImage(systemName: "eye.slash")!.size.width), height: Int(UIImage(systemName: "eye.slash")!.size.height))
        imageIcon3.frame = CGRect(x: -10, y: 0, width: Int(UIImage(systemName: "eye.slash")!.size.width), height: Int(UIImage(systemName: "eye.slash")!.size.height))
        
        
        oldPasswordTxt.rightView = content
        oldPasswordTxt.rightViewMode = .always
        
        newPasswordTxt.rightView = content2
        newPasswordTxt.rightViewMode = .always
        
        confirmPasswordTxt.rightView = content3
        confirmPasswordTxt.rightViewMode = .always
        
        
        let tapGestureRecoginizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecoginzer:)))
        imageIcon.isUserInteractionEnabled = true
        imageIcon.addGestureRecognizer(tapGestureRecoginizer)
        
        let tapGestureRecoginizer2 = UITapGestureRecognizer(target: self, action: #selector(imageTapped2(tapGestureRecoginzer:)))
        imageIcon2.isUserInteractionEnabled = true
        imageIcon2.addGestureRecognizer(tapGestureRecoginizer2)
        
        let tapGestureRecoginizer3 = UITapGestureRecognizer(target: self, action: #selector(imageTapped3(tapGestureRecoginzer:)))
        imageIcon3.isUserInteractionEnabled = true
        imageIcon3.addGestureRecognizer(tapGestureRecoginizer3)
        
    }
    
    @objc private func imageTapped(tapGestureRecoginzer: UITapGestureRecognizer) {
        let tappedImage = tapGestureRecoginzer.view as? UIImageView
        
        if iconClc {
            iconClc = false
            tappedImage?.image = UIImage(systemName: "eye")
            oldPasswordTxt.isSecureTextEntry = false
        } else {
            iconClc = true
            tappedImage?.image = UIImage(systemName: "eye.slash")
            oldPasswordTxt.isSecureTextEntry = true
        }
         
    }
    
    @objc private func imageTapped2(tapGestureRecoginzer: UITapGestureRecognizer) {
        let tappedImage = tapGestureRecoginzer.view as? UIImageView
        
        if iconClc2 {
            iconClc2 = false
            tappedImage?.image = UIImage(systemName: "eye")
            newPasswordTxt.isSecureTextEntry = false
        } else {
            iconClc2 = true
            tappedImage?.image = UIImage(systemName: "eye.slash")
            newPasswordTxt.isSecureTextEntry = true
        }
         
    }

    
    @objc private func imageTapped3(tapGestureRecoginzer: UITapGestureRecognizer) {
        let tappedImage = tapGestureRecoginzer.view as? UIImageView
        
        if iconClc3 {
            iconClc3 = false
            tappedImage?.image = UIImage(systemName: "eye")
            confirmPasswordTxt.isSecureTextEntry = false
        } else {
            iconClc3 = true
            tappedImage?.image = UIImage(systemName: "eye.slash")
            confirmPasswordTxt.isSecureTextEntry = true
        }
         
    }


}
