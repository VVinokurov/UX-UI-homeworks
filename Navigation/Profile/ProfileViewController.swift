//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Владимир Винокуров on 23.11.2022.
//

import UIKit

var cellID = "PostTableViewCell"
var cellPhotos = "PhotosTableViewCell"

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
    
    let box = UIButton(frame: .zero)
    let blurBox = UIView(frame: .zero)
    
    
    func addBut() {
        self.view.addSubview(box)
        box.setImage(UIImage(systemName: "clear"), for: .normal)
        box.addTarget(self, action: #selector(tapReverse), for: .touchUpInside)
        box.translatesAutoresizingMaskIntoConstraints = false
        box.backgroundColor = .clear
        box.alpha = 0.0
        NSLayoutConstraint.activate([
            box.trailingAnchor.constraint(equalTo: tableView.trailingAnchor, constant: -16),
            box.topAnchor.constraint(equalTo: tableView.topAnchor, constant: 16),
            box.heightAnchor.constraint(equalToConstant: 20),
            box.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func blur() {
        self.view.addSubview(blurBox)
        blurBox.translatesAutoresizingMaskIntoConstraints = false
        blurBox.backgroundColor = .white
        blurBox.alpha = 0.0
        NSLayoutConstraint.activate([
            blurBox.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blurBox.topAnchor.constraint(equalTo: view.topAnchor),
            blurBox.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            blurBox.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
    
    
    @objc func tapReverse () {
        UIView.animate(withDuration: 0.3, delay: 0, animations: {
            self.box.alpha = 0.0
        }) { _ in
            UIView.animate(withDuration: 0.5, delay: 0, animations: {
                self.blurBox.alpha = 0.0
                self.profileView.avatar.layer.cornerRadius = 64.0
                self.profileView.avatar.layer.borderWidth = 3.0
                self.profileView.avatar.center.x = 80
                self.profileView.avatar.center.y = 80
                self.profileView.avatar.transform = CGAffineTransform.identity
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
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: cellPhotos)
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
    
    @objc func tap(_ sender: UITapGestureRecognizer){
        self.blurBox.bringSubviewToFront(self.profileView.avatar)
        self.profileView.avatar.superview?.bringSubviewToFront(self.profileView.avatar)
        self.blur()
        self.addBut()
    
        UIView.animate(withDuration: 0.5, delay: 0, animations: {
            self.profileView.avatar.layer.cornerRadius = 0.0
            self.profileView.avatar.layer.borderWidth = 2.0
            self.profileView.avatar.center.x = self.tableView.bounds.width/2
            self.profileView.avatar.center.y = self.tableView.bounds.height/2
            let width = self.view.bounds.width / self.profileView.avatar.bounds.width
            self.profileView.avatar.transform = CGAffineTransform(scaleX: width, y: width)
            self.blurBox.alpha = 0.5
        }) { _ in
            UIView.animate(withDuration: 0.3, delay: 0, animations: {
                self.box.alpha = 1.0
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
            let cell = tableView.dequeueReusableCell(withIdentifier: cellPhotos, for: indexPath) as! PhotosTableViewCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! PostTableViewCell
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


