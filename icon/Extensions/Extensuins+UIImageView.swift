//
//  Extensuins+UIView.swift
//  icon
//
//  Created by WINMAC on 10/06/2023.
//

import UIKit
extension UIImageView {
    func makeCircular(){
        self.layer.cornerRadius = self.frame.width/2
    }
}
