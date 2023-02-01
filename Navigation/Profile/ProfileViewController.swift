//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Владимир Винокуров on 23.11.2022.
//

import UIKit

class ProfileViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var postsForTable = profilePosts
    
    var tableView = UITableView(frame: .zero, style: .grouped)
    
    let profileView = ProfileHeaderView()
    
    func addSubview(){
        self.view.addSubview(tableView)
        profileView.addSubview()
    }
    
    func addLayoutConstraints(){
        let safeArea = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
        profileView.setupConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubview()
        addLayoutConstraints()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = UITableView.automaticDimension
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosTableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
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
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
            return CGFloat.leastNormalMagnitude
        }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
            return UIView()
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
            let tapGesture : UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(labelTap(tapGesture:)))
            tapGesture.delegate = self
            cell.likes.tag = indexPath.row
            cell.likes.addGestureRecognizer(tapGesture)
            
            let imageTapGesture : UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(imageTap(imageTapGesture:)))
            imageTapGesture.delegate = self
            cell.image.tag = indexPath.row
            cell.image.addGestureRecognizer(imageTapGesture)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            postsForTable.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    @objc func labelTap(tapGesture:UITapGestureRecognizer){
        postsForTable[tapGesture.view!.tag].likes.self += 1
        self.tableView.reloadData()
    }
    
    @objc func imageTap(imageTapGesture:UITapGestureRecognizer){
        postsForTable[imageTapGesture.view!.tag].views.self += 1
        self.tableView.reloadData()
        let postDescriptionViewController = PostDescriptionViewController()
        postDescriptionViewController.postAuthor = postsForTable[imageTapGesture.view!.tag].author.self
        postDescriptionViewController.postImage = postsForTable[imageTapGesture.view!.tag].image.self
        postDescriptionViewController.postDescription = postsForTable[imageTapGesture.view!.tag].description.self
        postDescriptionViewController.postLikes = postsForTable[imageTapGesture.view!.tag].likes.self
        postDescriptionViewController.postViews = postsForTable[imageTapGesture.view!.tag].views.self
        self.navigationController?.pushViewController(postDescriptionViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
                let destination = PhotosViewController()
                navigationController?.pushViewController(destination, animated: true)
        }
    }
    
}


