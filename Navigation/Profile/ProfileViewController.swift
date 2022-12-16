//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Владимир Винокуров on 23.11.2022.
//

import UIKit

let groupSection = ["Photos","Posts"]

var cellID = "PostTableViewCell"
var cellPhotos = "PhotosTableViewCell"

struct Posts {
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
}

class ProfileViewController: UIViewController {

    var postsForTable = [Posts(author: "Интерфакс", description: "Цены на нефть растут после падения по итогам минувшей недели", image: "нефть.jpeg", likes: 200, views: 2350), Posts(author: "Minimalism", description: "В чем смысл минимализма? Почему нас вообще должно волновать меньшее потребление и нужно ли нам отказываться от всего, что есть?", image: "минимализм.jpeg", likes: 45, views: 573), Posts(author: "mini.people", description: "Прокачай свой MINI наклейками", image: "mini.jpeg", likes: 347, views: 1250), Posts(author: "kot.tattoo", description: "Свободный эскиз от мастера Саши", image: "кот.jpeg", likes: 206, views: 3458)]
    
    var imagesForTable = ["image1", "image2", "image3", "image4"]
    
    var tableView = UITableView(frame: .zero)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view.addSubview(tableView)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: cellPhotos)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
        
    }
    }

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
        }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let profileView = ProfileHeaderView()
                profileView.addSubview()
                profileView.setupConstraints()
                return profileView
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return UITableView.automaticDimension
        }else {
            return 0.0
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
    
}


