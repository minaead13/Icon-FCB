//
//  RegisterViewController.swift
//  icon
//
//  Created by WINMAC on 10/06/2023.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    var iconClc = false
    let imageIcon = UIImageView()
    
    var iconClc2 = false
    let imageIcon2 = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        securePassword()
    }
    
    @IBAction func DidTapSkip(_ sender: Any) {
        let vc = (self.storyboard?.instantiateViewController(withIdentifier: "LoginIDViewController"))!
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func didTaphaveAccount(_ sender: Any) {
        let vc = (self.storyboard?.instantiateViewController(withIdentifier: "ViewController"))!
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    private func securePassword() {
        imageIcon.image = UIImage(systemName: "eye.slash")
        let content = UIView()
        content.addSubview(imageIcon)
        content.frame = CGRect(x: 0, y: 0, width: Int(UIImage(systemName: "eye.slash")!.size.width), height: Int(UIImage(systemName: "eye.slash")!.size.height))
        imageIcon.frame = CGRect(x: -10, y: 0, width: Int(UIImage(systemName: "eye.slash")!.size.width), height: Int(UIImage(systemName: "eye.slash")!.size.height))
        passwordTextField.rightView = content
        passwordTextField.rightViewMode = .always
        let tapGestureRecoginizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecoginzer:)))
        imageIcon.isUserInteractionEnabled = true
        imageIcon.addGestureRecognizer(tapGestureRecoginizer)
        
        imageIcon2.image = UIImage(systemName: "eye.slash")
        let contentView = UIView()
        contentView.addSubview(imageIcon2)
        contentView.frame = CGRect(x: 0, y: 0, width: Int(UIImage(systemName: "eye.slash")!.size.width), height: Int(UIImage(systemName: "eye.slash")!.size.height))
        imageIcon2.frame = CGRect(x: -10, y: 0, width: Int(UIImage(systemName: "eye.slash")!.size.width), height: Int(UIImage(systemName: "eye.slash")!.size.height))
        confirmPasswordTextField.rightView = contentView
        confirmPasswordTextField.rightViewMode = .always
        
        let tapGestureRecoginizer2 = UITapGestureRecognizer(target: self, action: #selector(imageTapped2(tapGestureRecoginzer:)))
        imageIcon2.isUserInteractionEnabled = true
        imageIcon2.addGestureRecognizer(tapGestureRecoginizer2)
    }
    
    @objc private func imageTapped(tapGestureRecoginzer: UITapGestureRecognizer) {
        let tappedImage = tapGestureRecoginzer.view as? UIImageView
        
        if iconClc {
            iconClc = false
            tappedImage?.image = UIImage(systemName: "eye")
            passwordTextField.isSecureTextEntry = false
        } else {
            iconClc = true
            tappedImage?.image = UIImage(systemName: "eye.slash")
            passwordTextField.isSecureTextEntry = true
        }
        
    }
    
    @objc private func imageTapped2(tapGestureRecoginzer: UITapGestureRecognizer) {
        let tappedImage = tapGestureRecoginzer.view as? UIImageView
        
        if iconClc2 {
            iconClc2 = false
            tappedImage?.image = UIImage(systemName: "eye")
            confirmPasswordTextField.isSecureTextEntry = false
        } else {
            iconClc2 = true
            tappedImage?.image = UIImage(systemName: "eye.slash")
            confirmPasswordTextField.isSecureTextEntry = true
        }
        
    }
    
    

}
