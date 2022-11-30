//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Владимир Винокуров on 29.11.2022.
//

import Foundation
import UIKit

class ProfileHeaderView: UIView {

        lazy var avatar: UIImageView = {
            let imageView = UIImageView(image: UIImage(named: "avatar.jpeg"))
            imageView.frame = CGRect(x: 16, y: 16, width: 128, height: 128)
            imageView.layer.borderWidth = 3.0
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.layer.cornerRadius = 64.0
            imageView.clipsToBounds = true
            return imageView
        }()
        
        lazy var nickname: UILabel = {
            let name = UILabel (frame: CGRect(x: 235, y: 27, width: 218, height: 22))
            name.center = CGPoint(x: 268, y: 38)
            name.textAlignment = .left
            name.text = "Mr. Black"
            name.font = UIFont.boldSystemFont(ofSize: 18.0)
            name.textColor = .black
            return name
        }()
        
        lazy var statusText: UILabel = {
            let status = UILabel (frame: CGRect(x: 235, y: 80, width: 218, height: 22))
            status.center = CGPoint(x: 268, y: 87)
            status.textAlignment = .left
            status.text = "Waiting for something"
            status.font = UIFont(name: "HelveticaNeue", size: 14)
            status.textColor = .gray
            return status
        }()
    
       lazy var textField: UITextField = {
            var textEnter = UITextField (frame: CGRect(x: 235, y: 100, width: 218, height: 40))
           textEnter.center = CGPoint(x: 268, y: 120)
           textEnter.textAlignment = .left
           textEnter.contentVerticalAlignment = .center
           textEnter.font = UIFont(name: "HelveticaNeue", size: 15)
           textEnter.textColor = .black
           textEnter.backgroundColor = .white
           textEnter.layer.borderWidth = 1.0
           textEnter.layer.borderColor = UIColor.black.cgColor
           textEnter.layer.cornerRadius = 14.0
           textEnter.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
           textEnter.clearButtonMode = .always
           textEnter.keyboardType = UIKeyboardType.default
            return textEnter
        }()
    
        
        lazy var button: UIButton = {
            let button = UIButton()
            button.frame = CGRect(x: 16, y: 160, width: 362.0, height: 50)
            button.backgroundColor = .blue
            button.layer.cornerRadius = 14
            button.setTitle("Show Status", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
            button.layer.shadowOpacity = 0.7
            button.layer.shadowRadius = 4.0
            button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
            return button
        }()
    
    func addSubview(){
        self.addSubview(avatar)
        self.addSubview(nickname)
        self.addSubview(statusText)
        self.addSubview(textField)
        self.addSubview(button)
    }

    @objc func buttonPressed() {
       statusText.text = statusTextEdit
    }
    private var statusTextEdit: String = ""
    
    @objc func statusTextChanged(_sender: UITextField) {
       statusTextEdit = textField.text ?? ""
    }
}

