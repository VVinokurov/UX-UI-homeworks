//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Владимир Винокуров on 23.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    let mainView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view.addSubview(mainView)
        mainView.addSubview()
        mainView.backgroundColor = .lightGray
        mainView.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = self.view.safeAreaLayoutGuide
        let newButton = UIButton(frame: .zero)
        newButton.backgroundColor = .blue
        newButton.layer.cornerRadius = 0
        newButton.setTitle("New button", for: .normal)
        newButton.setTitleColor(.white, for: .normal)
        newButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        newButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(newButton)
        NSLayoutConstraint.activate([
            mainView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            mainView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            mainView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0),
            mainView.heightAnchor.constraint(equalToConstant: 220),
            newButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            newButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            newButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: 0),
            newButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        mainView.setupConstraints()
        // Do any additional setup after loading the view.
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

