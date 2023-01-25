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
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector (tapAvatar)))
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
        avatar.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 16),
        avatar.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
        avatar.heightAnchor.constraint(equalToConstant: 128),
        avatar.widthAnchor.constraint(equalToConstant: 128),
        button.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
        button.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
        button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 16),
        button.heightAnchor.constraint(equalToConstant: 50),
        button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
        nickname.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 27),
        nickname.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 160),
        nickname.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
        nickname.heightAnchor.constraint(equalToConstant: 25),
        textField.bottomAnchor.constraint(equalTo: self.button.topAnchor, constant: -16),
        textField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 160),
        textField.heightAnchor.constraint(equalToConstant: 40),
        textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
        textField.topAnchor.constraint(equalTo: self.statusText.bottomAnchor, constant: 16),
        statusText.topAnchor.constraint(equalTo: self.nickname.bottomAnchor, constant: 16),
        statusText.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 160),
        statusText.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
        statusText.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    let closeButton = UIButton(frame: .zero)
    let blackView = UIView(frame: CGRect(x:0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    
    func addBlackView() {
        self.addSubview(blackView)
        self.bringSubviewToFront(avatar)
        blackView.backgroundColor = .black
        blackView.alpha = 0.0
    }
    
    func addButton() {
        self.addSubview(closeButton)
        closeButton.setImage(UIImage(systemName: "clear"), for: .normal)
        closeButton.addTarget(self, action: #selector(tapReverse), for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.backgroundColor = .clear
        closeButton.alpha = 0.0
        let safeArea = self.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            closeButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            closeButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
            closeButton.heightAnchor.constraint(equalToConstant: 20),
            closeButton.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    @objc func tapAvatar(){
        self.addBlackView()
        self.addButton()
        NSLayoutConstraint.deactivate(avatar.constraints)
        self.avatar.translatesAutoresizingMaskIntoConstraints = true
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.blackView.alpha = 0.5
            self.avatar.layer.cornerRadius = 0.0
            self.avatar.layer.borderWidth = 0.0
            self.avatar.layer.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            self.avatar.center = CGPoint(x: self.safeAreaLayoutGuide.layoutFrame.width / 2, y: UIScreen.main.bounds.height / 2 - 60)
            self.layoutIfNeeded()

        }) { _ in
            UIView.animate(withDuration: 0.3, delay: 0, animations: {
                self.closeButton.alpha = 1.0
            })
        }
    }
    
    @objc func tapReverse () {
        
        UIView.animate(withDuration: 0.3, delay: 0) {
            self.closeButton.alpha = 0.0
            }
        UIView.animate(withDuration: 0.5, delay: 0) {
                self.blackView.alpha = 0.0
                self.avatar.layer.cornerRadius = 64.0
                self.avatar.layer.borderWidth = 3.0
                self.avatar.center.x = 80
                self.avatar.center.y = 80
                self.avatar.layer.bounds = CGRect (x: 0, y: 0, width: 128, height: 128)
                self.layoutIfNeeded()
                self.willRemoveSubview(self.blackView)
            }
        
    }
    
    private var statusTextEdit: String = ""
    func shakeTextField(textField: UITextField) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.09
        animation.repeatCount = 2
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: textField.center.x - 5, y: textField.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: textField.center.x + 5, y: textField.center.y))
        let animationColor = CABasicAnimation(keyPath: "backgroundColor")
        animationColor.duration = 0.09
        animationColor.repeatCount = 2
        animationColor.autoreverses = true
        animationColor.fromValue = UIColor(white: 1, alpha: 1).cgColor
        animationColor.toValue = UIColor(red: 1, green: 0, blue: 0, alpha: 0.3).cgColor
        textField.layer.add(animation, forKey: "position")
        textField.layer.add(animationColor, forKey: "backgroundColor")
    }
    
    @objc func buttonPressed() {
        if statusTextEdit == "" {
            shakeTextField(textField: textField)
        } else {
            statusText.text = statusTextEdit
        }
    }

    
    @objc func statusTextChanged(_sender: UITextField) {
       statusTextEdit = textField.text ?? ""
    }
}

