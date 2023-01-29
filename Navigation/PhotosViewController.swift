//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Владимир Винокуров on 17.12.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    var photos = ["image1.jpeg", "image2.jpeg", "image3.jpeg", "image4.jpeg","image5.jpeg", "image6.jpeg", "image7.jpeg", "image8.jpeg", "image9.jpeg", "image10.jpeg", "image11.jpeg", "image12.jpeg", "image13.jpeg", "image14.jpeg", "image15.jpeg", "image16.jpeg", "image17.jpeg", "image18.jpeg", "image19.jpeg", "image20.jpeg"]
    
    let closeButton = UIButton(frame: .zero)
    var blackView = UIView(frame: .zero)
    
    func addBlackView() {
        collectionView.addSubview(blackView)
        collectionView.bringSubviewToFront(blackView)
        blackView.backgroundColor = .black
        blackView.alpha = 0.0
    }
    
    func addButton() {
        view.addSubview(closeButton)
        closeButton.setImage(UIImage(systemName: "clear"), for: .normal)
        closeButton.addTarget(self, action: #selector(tapReverse), for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.backgroundColor = .clear
        closeButton.alpha = 0.0
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            closeButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            closeButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
            closeButton.heightAnchor.constraint(equalToConstant: 20),
            closeButton.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
 
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
        cell.centerX = cell.center.x
        cell.centerY = cell.center.y
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (view.safeAreaLayoutGuide.layoutFrame.width - 32)/3, height: (view.safeAreaLayoutGuide.layoutFrame.width - 32)/3)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)! as! PhotosCollectionViewCell
        collectionView.allowsSelection = false
        blackView = UIView(frame: CGRect(x:0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height+100))
        self.addBlackView()
        self.addButton()
        collectionView.bringSubviewToFront(cell)
        closeButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapReverse)))
        closeButton.tag = indexPath.row
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.blackView.alpha = 0.5
            cell.layer.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width + 16, height: UIScreen.main.bounds.width)
            cell.center.x = self.blackView.center.x
            cell.center.y = self.view.safeAreaLayoutGuide.layoutFrame.height / 2
            cell.image.contentMode = .scaleAspectFit
            collectionView.layoutIfNeeded()
        }) { _ in
            UIView.animate(withDuration: 0.3, delay: 0, animations: {
                self.closeButton.alpha = 1.0
            })
        }
          
    }
    @objc private func tapReverse () {
        let cell = collectionView.cellForItem(at: [0, closeButton.tag])! as! PhotosCollectionViewCell
        UIView.animate(withDuration: 0.3, delay: 0, animations: {
            self.closeButton.alpha = 0.0
        }) { _ in
            UIView.transition(with: cell.image, duration: 0.5, options: .transitionCrossDissolve, animations: {
                cell.image.contentMode = .scaleAspectFill
                }, completion: nil)
            UIView.animate(withDuration: 0.5, delay: 0, animations: {
                self.blackView.alpha = 0.0
                cell.center.x = cell.centerX
                cell.center.y = cell.centerY
                cell.layer.bounds = CGRect (x: 0, y: 0, width: (self.view.safeAreaLayoutGuide.layoutFrame.width - 32)/3, height: (self.view.safeAreaLayoutGuide.layoutFrame.width - 32)/3)
                self.collectionView.layoutIfNeeded()
            })
            self.collectionView.allowsSelection = true
        }
    }
}
