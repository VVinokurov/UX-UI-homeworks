//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Владимир Винокуров on 17.12.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell, UICollectionViewDelegate {
    
    static let reusableId = "collection cell"
    
    var centerX: CGFloat = 0
    var centerY: CGFloat = 0
    
    var image: UIImageView = {
        let image = UIImageView(image: UIImage(named: ""))
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.isUserInteractionEnabled = true
        return image
    }()
    
    func addLayoutConstraints(){
        NSLayoutConstraint.activate ([
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(image)
        addLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
}
