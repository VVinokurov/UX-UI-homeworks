//
//  LogInViewController.swift
//  Navigation
//
//  Created by Владимир Винокуров on 06.12.2022.
//

import UIKit

class LogInViewController: UIViewController {

    let colorHex = UIColor(named: "ColorSet")
    var standartLogin = "vinokurov@mail.ru"
    var standartPassword = "12345"
    
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        scrollView.keyboardDismissMode = .interactive
        return scrollView
    }()
    
    
    lazy var logo: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "VK.png"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var warningLabel: UILabel = {
        let passwordLabel = UILabel()
        passwordLabel.text = "Пароль должен состоять из пяти или более символов"
        passwordLabel.font = UIFont.systemFont(ofSize: 10.0)
        passwordLabel.textColor = .red
        passwordLabel.textAlignment = .center
        passwordLabel.isHidden = true
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        return passwordLabel
    } ()
    
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
            login.backgroundColor = .clear
            login.clearButtonMode = .always
            login.autocapitalizationType = .none
            login.keyboardType = UIKeyboardType.default
            login.translatesAutoresizingMaskIntoConstraints = false
            return login
        }()
    
    var blackLine: UIView = {
        let blackLine = UIView(frame: .zero)
        blackLine.backgroundColor = .lightGray
        blackLine.translatesAutoresizingMaskIntoConstraints = false
        return blackLine
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
            password.backgroundColor = .clear
            password.clearButtonMode = .always
            password.autocapitalizationType = .none
            password.isSecureTextEntry = true
            password.keyboardType = UIKeyboardType.default
            password.addTarget(self, action: #selector(passwordChanged), for: .editingChanged)
            password.translatesAutoresizingMaskIntoConstraints = false
            return password
        }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.layer.borderWidth = 0.5
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.cornerRadius = 10.0
        stackView.backgroundColor = .systemGray6
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
        animation.fromValue = NSValue(cgPoint: CGPoint(x: textField.center.x - 3, y: textField.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: textField.center.x + 3, y: textField.center.y))
        let animationColor = CABasicAnimation(keyPath: "backgroundColor")
        animationColor.duration = 0.09
        animationColor.repeatCount = 2
        animationColor.autoreverses = true
        animationColor.fromValue = UIColor(white: 1, alpha: 1).cgColor
        animationColor.toValue = UIColor(red: 1, green: 0, blue: 0, alpha: 0.3).cgColor
        textField.layer.add(animation, forKey: "position")
        textField.layer.add(animationColor, forKey: "backgroundColor")
    }
    
    func validBy (email: String) -> Bool {
        let emailPattern = #"^[a-z0-9][-_.a-z0-9]{0,20}@[a-z0-9][a-z0-9]{0,30}[a-z0-9].[a-z]{2,8}$"#
        let result = email.range(of: emailPattern, options: .regularExpression)
        let validEmail = (result != nil)
        return validEmail
    }
    
    @objc func goToProfile () {
        if loginText.text == "" && passwordText.text == "" {
            shakeTextField(textField: loginText)
            shakeTextField(textField: passwordText)
        } else if loginText.text == "" {
            shakeTextField(textField: loginText)
        } else if passwordText.text == "" {
            shakeTextField(textField: passwordText)
        } else {
            if passwordText.text!.count < 5 {
                shakeTextField(textField: passwordText)
            } else {
                if validBy(email: loginText.text ?? "") {
                    if loginText.text == standartLogin && passwordText.text == standartPassword {
                        let profileViewController = ProfileViewController()
                        profileViewController.title = "Profile"
                        self.navigationController?.pushViewController(profileViewController, animated: true)
                        self.navigationController?.isNavigationBarHidden = false
                    } else {
                        let alert = UIAlertController(title: "Введен неверный логин или пароль", message: "Попробуйте ввести заново", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
                        self.present(alert, animated: true)
                    }
                } else {
                    shakeTextField(textField: loginText)
                }
            }
        }
    }
    
    @objc func passwordChanged(password: UITextField) {
        if password.text == "" {
            warningLabel.isHidden = true
        } else {
        if password.text!.count < 5 {
            warningLabel.isHidden = false
            } else {
                warningLabel.isHidden = true
            }
        }
    }

    func addSubview(){
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        scrollView.addSubview(logo)
        stackView.addArrangedSubview(loginText)
        stackView.addArrangedSubview(blackLine)
        stackView.addArrangedSubview(passwordText)
        scrollView.addSubview(warningLabel)
        scrollView.addSubview(buttonLogIn)
    }
    
    func addLayoutConstraints(){
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
            stackView.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 120),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 100.5),
            stackView.bottomAnchor.constraint(equalTo: warningLabel.topAnchor, constant: -5),
            loginText.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 0),
            loginText.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0),
            loginText.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0),
            loginText.heightAnchor.constraint(equalToConstant: 50),
            blackLine.topAnchor.constraint(equalTo: loginText.bottomAnchor, constant: 0),
            blackLine.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0),
            blackLine.heightAnchor.constraint(equalToConstant: 0.5),
            blackLine.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0),
            blackLine.bottomAnchor.constraint(equalTo: passwordText.topAnchor, constant: 0),
            passwordText.topAnchor.constraint(equalTo: blackLine.bottomAnchor, constant: 0),
            passwordText.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0),
            passwordText.heightAnchor.constraint(equalToConstant: 50),
            passwordText.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0),
            passwordText.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 0),
            warningLabel.topAnchor.constraint(equalTo: passwordText.bottomAnchor, constant: 5),
            warningLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 5),
            warningLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: 5),
            warningLabel.widthAnchor.constraint(equalToConstant: scrollView.bounds.width - 20),
            warningLabel.heightAnchor.constraint(equalToConstant: 10),
            warningLabel.bottomAnchor.constraint(equalTo: buttonLogIn.topAnchor, constant: -5),
            buttonLogIn.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            buttonLogIn.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            buttonLogIn.topAnchor.constraint(equalTo: warningLabel.bottomAnchor, constant: 5),
            buttonLogIn.heightAnchor.constraint(equalToConstant: 50),
            buttonLogIn.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -50),
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
        addSubview()
        addLayoutConstraints()
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
}
