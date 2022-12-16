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
            imageView.layer.borderWidth = 3.0
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.layer.cornerRadius = 64.0
            imageView.clipsToBounds = true
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
    
    
        lazy var nickname: UILabel = {
            let name = UILabel(frame: .zero)
            name.textAlignment = .left
            name.text = "Mr. Black and White"
            name.font = UIFont.boldSystemFont(ofSize: 18.0)
            name.textColor = .black
            name.translatesAutoresizingMaskIntoConstraints = false
            return name
        }()
        
        lazy var statusText: UILabel = {
            let status = UILabel (frame: .zero)
            status.textAlignment = .left
            status.text = "Waiting for something"
            status.font = UIFont(name: "HelveticaNeue", size: 14)
            status.textColor = .gray
            status.translatesAutoresizingMaskIntoConstraints = false
            return status
        }()
    
       lazy var textField: UITextField = {
           var textEnter = UITextField (frame: .zero)
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
           textEnter.translatesAutoresizingMaskIntoConstraints = false
            return textEnter
        }()
    
        
        lazy var button: UIButton = {
            let button = UIButton()
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
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
    
    func addSubview(){
        self.addSubview(avatar)
        self.addSubview(nickname)
        self.addSubview(statusText)
        self.addSubview(textField)
        self.addSubview(button)
        self.backgroundColor = .lightGray
    }
    
    func setupConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
        avatar.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
        avatar.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
        avatar.heightAnchor.constraint(equalToConstant: 128),
        avatar.widthAnchor.constraint(equalToConstant: 128),
        avatar.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -16),
        button.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
        button.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
        button.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 16),
        button.heightAnchor.constraint(equalToConstant: 50),
        button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
        nickname.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 27),
        nickname.leadingAnchor.constraint(equalTo: self.avatar.trailingAnchor, constant: 16),
        nickname.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
        nickname.heightAnchor.constraint(equalToConstant: 25),
        textField.bottomAnchor.constraint(equalTo: self.button.topAnchor, constant: -16),
        textField.leadingAnchor.constraint(equalTo: self.avatar.trailingAnchor, constant: 16),
        textField.heightAnchor.constraint(equalToConstant: 40),
        textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
        textField.topAnchor.constraint(equalTo: self.statusText.bottomAnchor, constant: 16),
        statusText.topAnchor.constraint(equalTo: self.nickname.bottomAnchor, constant: 16),
        statusText.leadingAnchor.constraint(equalTo: self.avatar.trailingAnchor, constant: 16),
        statusText.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
        statusText.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    @objc func buttonPressed() {
       statusText.text = statusTextEdit
    }
    private var statusTextEdit: String = ""
    
    @objc func statusTextChanged(_sender: UITextField) {
       statusTextEdit = textField.text ?? ""
    }
}

