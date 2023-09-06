//
//  ViewController.swift
//  icon
//
//  Created by WINMAC on 10/06/2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var iconClc = false
    let imageIcon = UIImageView()
    let imageIcon2 = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        securePassword()
    }
    
    @IBAction func DidTapForget(_ sender: Any) {
        let alert = UIAlertController(title: "Forgot Password", message: "Please enter your email and we will send recovery details", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel){(_) in
            self.dismiss(animated: true)
        })
        
        alert.addAction(UIAlertAction(title: "Confirm", style: .default){(_) in
            guard let fields = alert.textFields, fields.count == 1 else {
                return
            }
            
            let emailField = fields[0]
            
            guard let email = emailField.text , !email.isEmpty else {
                print("Invalid entries")
                return
            }
            print("email: \(email)")
        })
        
        
        
        alert.addTextField{ field in
            field.placeholder = "Email"
            field.keyboardType = .emailAddress
            
            self.imageIcon2.image = UIImage(systemName: "envelope")
            let content = UIView()
            content.addSubview(self.imageIcon2)
            content.frame = CGRect(x: 0, y: 0, width: Int(UIImage(systemName: "envelope")!.size.width), height: Int(UIImage(systemName: "envelope")!.size.height))
            self.imageIcon2.frame = CGRect(x: 0, y: 0, width: Int(UIImage(systemName: "envelope")!.size.width), height: Int(UIImage(systemName: "envelope")!.size.height))
            field.leftView = content
            field.leftViewMode = .always

            
        }
        present(alert, animated: true)
    }
    
    
    
    @IBAction func DidTapSkip(_ sender: Any) {
        let vc = (self.storyboard?.instantiateViewController(withIdentifier: "LoginIDViewController"))!
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTapCreate(_ sender: Any) {
        let vc = (self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController"))!
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTapForget(_ sender: Any) {
//        let vc = (self.storyboard?.instantiateViewController(withIdentifier: "changePasswordViewController"))!
//        self.navigationController?.pushViewController(vc, animated: true)
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
}

