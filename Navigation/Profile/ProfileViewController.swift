//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Владимир Винокуров on 23.11.2022.
//

import UIKit

struct Posts {
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
}

class ProfileViewController: UIViewController, UIGestureRecognizerDelegate {

    var postsForTable = [Posts(author: "Интерфакс", description: "Цены на нефть растут после падения по итогам минувшей недели", image: "нефть.jpeg", likes: 200, views: 2350), Posts(author: "Minimalism", description: "В чем смысл минимализма? Почему нас вообще должно волновать меньшее потребление и нужно ли нам отказываться от всего, что есть?", image: "минимализм.jpeg", likes: 45, views: 573), Posts(author: "mini.people", description: "Прокачай свой MINI наклейками", image: "mini.jpeg", likes: 347, views: 1250), Posts(author: "kot.tattoo", description: "Свободный эскиз от мастера Саши", image: "кот.jpeg", likes: 206, views: 3458)]
    
    var tableView = UITableView(frame: .zero)
    
    let closeButton = UIButton(frame: .zero)
    let blackView = UIView(frame: .zero)
    
    func addButton() {
        self.view.addSubview(closeButton)
        closeButton.setImage(UIImage(systemName: "clear"), for: .normal)
        closeButton.addTarget(self, action: #selector(tapReverse), for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.backgroundColor = .clear
        closeButton.alpha = 0.0
        NSLayoutConstraint.activate([
            closeButton.trailingAnchor.constraint(equalTo: tableView.trailingAnchor, constant: -16),
            closeButton.topAnchor.constraint(equalTo: tableView.topAnchor, constant: 16),
            closeButton.heightAnchor.constraint(equalToConstant: 20),
            closeButton.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func addBlackView() {
        self.view.addSubview(blackView)
        blackView.translatesAutoresizingMaskIntoConstraints = false
        blackView.backgroundColor = .white
        blackView.alpha = 0.0
        NSLayoutConstraint.activate([
            blackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blackView.topAnchor.constraint(equalTo: view.topAnchor),
            blackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            blackView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
    
    
    @objc func tapReverse () {
        UIView.animate(withDuration: 0.3, delay: 0, animations: {
            self.closeButton.alpha = 0.0
        }) { _ in
            UIView.animate(withDuration: 0.5, delay: 0, animations: {
                self.blackView.alpha = 0.0
                self.profileView.avatar.layer.cornerRadius = 64.0
                self.profileView.avatar.layer.borderWidth = 3.0
                self.profileView.avatar.center.x = 80
                self.profileView.avatar.center.y = 80
                self.profileView.avatar.layer.bounds = CGRect (x: 0, y: 0, width: 128, height: 128)
            })
        }
    }
    
    let profileView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view.addSubview(tableView)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.sectionHeaderTopPadding = .leastNormalMagnitude
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosTableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        profileView.addSubview()
        profileView.setupConstraints()
        self.tableView.layer.backgroundColor = UIColor.white.cgColor
        self.tableView.layer.opacity = 1.0
        profileView.avatar.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap)))
        self.profileView.bringSubviewToFront(profileView.avatar)
       
        
        let safeArea = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    
    }
    
    @objc func tap(){
        self.addBlackView()
        self.addButton()
    
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.blackView.alpha = 0.5
            self.profileView.avatar.layer.cornerRadius = 0.0
            self.profileView.avatar.layer.borderWidth = 0.0
            self.profileView.avatar.layer.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width,
            height: UIScreen.main.bounds.width)
            self.profileView.avatar.center = CGPoint(x: self.tableView.bounds.width/2, y: self.tableView.bounds.height/2)
            self.profileView.avatar.layoutIfNeeded()

        }) { _ in
            UIView.animate(withDuration: 0.3, delay: 0, animations: {
                self.closeButton.alpha = 1.0
            })
        }
    }
    }

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
        }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return profileView
        } else {
            return nil
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return UITableView.automaticDimension
        }else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section) {
        case 0:
                return 1
        default:
                return postsForTable.count
            }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch(indexPath.section) {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: indexPath) as! PhotosTableViewCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
            cell.author.text = postsForTable[indexPath.item].author
            cell.image.image = UIImage(named: postsForTable[indexPath.item].image)
            cell.descrip.text = postsForTable[indexPath.item].description
            cell.likes.text = "Likes: " + String(postsForTable[indexPath.item].likes)
            cell.views.text = "Views: " + String(postsForTable[indexPath.item].views)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
                let destination = PhotosViewController()
                navigationController?.pushViewController(destination, animated: true)
        }
    }
    
}


