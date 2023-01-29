//
//  PostDescriptionViewController.swift
//  Navigation
//
//  Created by Владимир Винокуров on 24.01.2023.
//

import UIKit

class PostDescriptionViewController: UIViewController {

    var scrollView: UIScrollView!
    var postAuthor: String = ""
    var postImage: String = ""
    var postDescription: String = ""
    var postLikes: Int = 0
    var postViews: Int = 0
    
    var image: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: ""))
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var descrip: UILabel = {
        let des = UILabel ()
        des.font = UIFont.systemFont(ofSize: 14.0)
        des.textColor = .systemGray
        des.numberOfLines = 0
        des.translatesAutoresizingMaskIntoConstraints = false
        return des
    }()
    
    var likes: UILabel = {
        let likes = UILabel ()
        likes.font = UIFont.systemFont(ofSize: 16.0)
        likes.textColor = .black
        likes.translatesAutoresizingMaskIntoConstraints = false
        likes.isUserInteractionEnabled = true
        return likes
    }()
    
    var views: UILabel = {
        let views = UILabel ()
        views.font = UIFont.systemFont(ofSize: 16.0)
        views.textColor = .black
        views.translatesAutoresizingMaskIntoConstraints = false
        return views
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = postAuthor
        scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        view.addSubview(scrollView)
        image.image = UIImage(named: postImage)
        descrip.text = postDescription
        likes.text = "Likes: " + String(postLikes)
        views.text = "Views: " + String(postViews)
        scrollView.addSubview(descrip)
        scrollView.addSubview(image)
        scrollView.addSubview(likes)
        scrollView.addSubview(views)
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            scrollView.heightAnchor.constraint(equalTo: safeArea.heightAnchor),
            scrollView.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: 0),
            scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: 0),
            image.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            image.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            image.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            image.heightAnchor.constraint(equalTo: image.widthAnchor),
            image.bottomAnchor.constraint(equalTo: descrip.topAnchor, constant: -16),
            descrip.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16),
            descrip.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 16),
            descrip.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: -16),
            descrip.bottomAnchor.constraint(equalTo: likes.topAnchor, constant: -16),
            likes.topAnchor.constraint(equalTo: descrip.bottomAnchor, constant: 16),
            likes.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 16),
            likes.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -16),
            likes.heightAnchor.constraint(equalToConstant: 16),
            views.topAnchor.constraint(equalTo: descrip.bottomAnchor, constant: 16),
            views.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: -16),
            views.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -16),
            views.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
}
