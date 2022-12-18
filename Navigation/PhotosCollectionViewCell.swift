//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Владимир Винокуров on 17.12.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    static let reusableId = "collection cell"
    
    var image: UIImageView!
    
    override init(frame: CGRect) {
        image = UIImageView(image: UIImage(named: ""))
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        super.init(frame: frame)
        contentView.addSubview(image)
        contentView.backgroundColor = .black
        NSLayoutConstraint.activate ([
            image.topAnchor.constraint(equalTo: topAnchor),
            image.bottomAnchor.constraint(equalTo: bottomAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.trailingAnchor.constraint(equalTo: trailingAnchor),
            ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
