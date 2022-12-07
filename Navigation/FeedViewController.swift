//
//  FeedViewController.swift
//  Navigation
//
//  Created by Владимир Винокуров on 23.11.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    var post = Post(title: "Мой пост")
    lazy var button1: UIButton = {
        let button1 = UIButton()
        button1.backgroundColor = .blue
        button1.layer.cornerRadius = 0
        button1.setTitle("Post 1", for: .normal)
        button1.setTitleColor(.white, for: .normal)
        button1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button1.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button1
    }()
    lazy var button2: UIButton = {
        let button2 = UIButton()
        button2.backgroundColor = .blue
        button2.layer.cornerRadius = 0
        button2.setTitle("Post 2", for: .normal)
        button2.setTitleColor(.white, for: .normal)
        button2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button2.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button2
    }()
    @objc private func buttonAction() {
        let postViewController = PostViewController()
        self.navigationController?.pushViewController(postViewController, animated: true)
    }

// comment previous button
//    private lazy var button: UIButton = {
//            let button = UIButton()
//            button.backgroundColor = .blue
//            button.layer.cornerRadius = 12
//            button.setTitle("Перейти на пост", for: .normal)
//            button.setTitleColor(.lightGray, for: .normal)
//            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
//            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
//            button.translatesAutoresizingMaskIntoConstraints = false
//            return button
//        }()
//
//    private func setupButton () {
//            self.view.addSubview(self.button)
//            self.button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
//            self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
//            self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
//            self.button.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        }
//
//    @objc private func buttonAction() {
//            let postViewController = PostViewController()
//            self.navigationController?.pushViewController(postViewController, animated: true)
//            postViewController.titlePost = post.title
//        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 100),
            stackView.heightAnchor.constraint(equalToConstant: 100)])
        
        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)
        
        
        
        
        
        // Do any additional setup after loading the view.
    }

}

