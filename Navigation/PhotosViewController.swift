//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Владимир Винокуров on 17.12.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    var photos = ["image1.jpeg", "image2.jpeg", "image3.jpeg", "image4.jpeg","image5.jpeg", "image6.jpeg", "image7.jpeg", "image8.jpeg", "image9.jpeg", "image10.jpeg", "image11.jpeg", "image12.jpeg", "image13.jpeg", "image14.jpeg", "image15.jpeg", "image16.jpeg", "image17.jpeg", "image18.jpeg", "image19.jpeg", "image20.jpeg"]
    
    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        viewLayout.scrollDirection = .vertical
        viewLayout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        viewLayout.minimumLineSpacing = 8
        viewLayout.minimumInteritemSpacing = 8
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "Photo Gallery"
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.reusableId)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.reusableId, for: indexPath) as! PhotosCollectionViewCell
        cell.image.image = UIImage(named: photos[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (view.safeAreaLayoutGuide.layoutFrame.width - 32)/3, height: (view.safeAreaLayoutGuide.layoutFrame.width - 32)/3)
    }

}
