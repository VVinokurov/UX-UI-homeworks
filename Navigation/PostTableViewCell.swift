//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Владимир Винокуров on 12.12.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    var author: UILabel = {
        let name = UILabel(frame: .zero)
        name.font = UIFont.boldSystemFont(ofSize: 20.0)
        name.textColor = .black
        name.numberOfLines = 2
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
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
    
    func tapFunction(sender:UITapGestureRecognizer) {
            print("tap working")
        }
    
    var views: UILabel = {
        let views = UILabel ()
        views.font = UIFont.systemFont(ofSize: 16.0)
        views.textColor = .black
        views.translatesAutoresizingMaskIntoConstraints = false
        return views
    }()
    
    let containerView: UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.clipsToBounds = false
      return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViewsAndlayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addSubViewsAndlayout() {
        containerView.addSubview(author)
        containerView.addSubview(image)
        containerView.addSubview(descrip)
        containerView.addSubview(likes)
        containerView.addSubview(views)
        contentView.addSubview(containerView)
    
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            author.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 16),
            author.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 16),
            author.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -16),
            author.bottomAnchor.constraint(equalTo: image.topAnchor, constant: -12),
            image.topAnchor.constraint(equalTo: author.bottomAnchor, constant: 12),
            image.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            image.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            image.heightAnchor.constraint(equalTo: image.widthAnchor),
            image.bottomAnchor.constraint(equalTo: descrip.topAnchor, constant: -16),
            descrip.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16),
            descrip.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 16),
            descrip.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -16),
            descrip.bottomAnchor.constraint(equalTo: likes.topAnchor, constant: -16),
            likes.topAnchor.constraint(equalTo: descrip.bottomAnchor, constant: 16),
            likes.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 16),
            likes.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -16),
            likes.heightAnchor.constraint(equalToConstant: 16),
            views.topAnchor.constraint(equalTo: descrip.bottomAnchor, constant: 16),
            views.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -16),
            views.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -16),
            views.heightAnchor.constraint(equalToConstant: 16)
        ])
    }


    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
