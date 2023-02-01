//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Владимир Винокуров on 16.12.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    var label: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Photos"
        label.font = UIFont.boldSystemFont(ofSize: 24.0)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var image1: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "image1.jpeg"))
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6.0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var image2: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "image2.jpeg"))
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6.0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var image3: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "image3.jpeg"))
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6.0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var image4: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "image4.jpeg"))
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6.0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var imageArrowRight: UIImageView = {
        var image = UIImageView(image: UIImage(systemName: "arrow.right"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .black
        image.clipsToBounds = true
        return image
    }()
    
    func addSubViews() {
        contentView.addSubview(label)
        contentView.addSubview(image1)
        contentView.addSubview(image2)
        contentView.addSubview(image3)
        contentView.addSubview(image4)
        contentView.addSubview(imageArrowRight)
    }
    
    func addLayoutConstraints() {
        NSLayoutConstraint.activate ([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            label.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: -12),
            label.heightAnchor.constraint(equalToConstant: 24),
            image1.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 12),
            image1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            image1.widthAnchor.constraint(equalToConstant: (contentView.frame.width - 48)/4),
            image1.heightAnchor.constraint(equalTo: image1.widthAnchor, multiplier: 2/3),
            image1.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            image2.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 12),
            image2.leadingAnchor.constraint(equalTo: image1.trailingAnchor, constant: 8),
            image2.widthAnchor.constraint(equalToConstant: (contentView.frame.width - 48)/4),
            image2.heightAnchor.constraint(equalTo: image2.widthAnchor, multiplier: 2/3),
            image2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            image3.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 12),
            image3.leadingAnchor.constraint(equalTo: image2.trailingAnchor, constant: 8),
            image3.widthAnchor.constraint(equalToConstant: (contentView.frame.width - 48)/4),
            image3.heightAnchor.constraint(equalTo: image3.widthAnchor, multiplier: 2/3),
            image3.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            image4.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 12),
            image4.leadingAnchor.constraint(equalTo: image3.trailingAnchor, constant: 8),
            image4.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            image4.widthAnchor.constraint(equalToConstant: (contentView.frame.width - 48)/4),
            image4.heightAnchor.constraint(equalTo: image4.widthAnchor, multiplier: 2/3),
            image4.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            imageArrowRight.centerYAnchor.constraint(equalTo: label.centerYAnchor),
            imageArrowRight.heightAnchor.constraint(equalToConstant: 20),
            imageArrowRight.widthAnchor.constraint(equalToConstant: 20),
            imageArrowRight.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12)
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
        addLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
