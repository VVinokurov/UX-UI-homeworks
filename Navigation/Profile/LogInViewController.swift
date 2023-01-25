//
//  LogInViewController.swift
//  Navigation
//
//  Created by Владимир Винокуров on 06.12.2022.
//

import UIKit

class LogInViewController: UIViewController {

    var scrollView: UIScrollView!
    let colorHex = UIColor(named: "ColorSet")
    
    lazy var logo: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "VK.png"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

        lazy var loginText: UITextField = {
            let login = UITextField(frame: .zero)
            login.placeholder = "Email of phone"
            login.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: login.frame.height))
            login.leftViewMode = .always
            login.textAlignment = .left
            login.contentVerticalAlignment = .center
            login.font = UIFont(name: "SystemFont", size: 16)
            login.textColor = .black
            login.tintColor = colorHex
            login.backgroundColor = .systemGray6
            login.layer.borderWidth = 0.5
            login.layer.borderColor = UIColor.lightGray.cgColor
            login.layer.cornerRadius = 10.0
            login.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
            login.clearButtonMode = .always
            login.autocapitalizationType = .none
            login.keyboardType = UIKeyboardType.default
            login.translatesAutoresizingMaskIntoConstraints = false
            return login
        }()
        
        lazy var passwordText: UITextField = {
            let password = UITextField(frame: .zero)
            password.placeholder = "Password"
            password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: password.frame.height))
            password.leftViewMode = .always
            password.textAlignment = .left
            password.contentVerticalAlignment = .center
            password.font = UIFont(name: "SystemFont", size: 16)
            password.textColor = .black
            password.tintColor = colorHex
            password.backgroundColor = .systemGray6
            password.layer.borderWidth = 0.5
            password.layer.borderColor = UIColor.lightGray.cgColor
            password.layer.cornerRadius = 10.0
            password.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            password.clearButtonMode = .always
            password.autocapitalizationType = .none
            password.isSecureTextEntry = true
            password.keyboardType = UIKeyboardType.default
            password.translatesAutoresizingMaskIntoConstraints = false
            return password
        }()
    
    lazy var buttonLogIn: UIButton = {
        let button = UIButton()
        let myImage = UIImage(named: "blue_pixel")
        button.backgroundColor = UIColor(patternImage: UIImage(named: "blue_pixel.png") ?? UIImage())
        button.layer.cornerRadius = 10
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.addTarget(self, action: #selector(goToProfile), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func shakeTextField(textField: UITextField) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.09
        animation.repeatCount = 2
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: textField.center.x - 2, y: textField.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: textField.center.x + 2, y: textField.center.y))
        let animationColor = CABasicAnimation(keyPath: "backgroundColor")
        animationColor.duration = 0.09
        animationColor.repeatCount = 2
        animationColor.autoreverses = true
        animationColor.fromValue = UIColor(white: 1, alpha: 1).cgColor
        animationColor.toValue = UIColor(red: 1, green: 0, blue: 0, alpha: 0.3).cgColor
        textField.layer.add(animation, forKey: "position")
        textField.layer.add(animationColor, forKey: "backgroundColor")
    }
    
    @objc func goToProfile () {
        if loginText.text == "" && passwordText.text == "" {
            print ("введите логин пароль")
            shakeTextField(textField: loginText)
            shakeTextField(textField: passwordText)
        } else if loginText.text == "" {
            print ("введите логин")
            shakeTextField(textField: loginText)
        } else if passwordText.text == "" {
            print ("введите пароль")
            shakeTextField(textField: passwordText)
        } else {
            let profileViewController = ProfileViewController()
            profileViewController.title = "Profile"
            self.navigationController?.pushViewController(profileViewController, animated: true)
            self.navigationController?.isNavigationBarHidden = false
        }
    }

    func addSubview(){
        scrollView.addSubview(logo)
        scrollView.addSubview(loginText)
        scrollView.addSubview(passwordText)
        scrollView.addSubview(buttonLogIn)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
        scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        view.addSubview(scrollView)
        addSubview()
        scrollView.keyboardDismissMode = .interactive
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            scrollView.heightAnchor.constraint(equalTo: safeArea.heightAnchor),
            scrollView.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: 0),
            scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logo.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            logo.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 120),
            logo.heightAnchor.constraint(equalToConstant: 100),
            logo.widthAnchor.constraint(equalToConstant: 100),
            loginText.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 120),
            loginText.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            loginText.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            loginText.heightAnchor.constraint(equalToConstant: 50),
            passwordText.topAnchor.constraint(equalTo: loginText.bottomAnchor, constant: 0),
            passwordText.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            passwordText.heightAnchor.constraint(equalToConstant: 50),
            passwordText.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            buttonLogIn.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            buttonLogIn.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            buttonLogIn.topAnchor.constraint(equalTo: passwordText.bottomAnchor, constant: 16),
            buttonLogIn.heightAnchor.constraint(equalToConstant: 50),
            buttonLogIn.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeKeyboardEvents()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    
    func subscribeKeyboardEvents() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: NSNotification){
        guard let ks = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {return}
        self.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: ks.height - self.view.safeAreaInsets.bottom + 30, right: 0)
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification){
        self.scrollView.contentInset = .zero
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
