//
//  PostViewController.swift
//  Navigation
//
//  Created by Владимир Винокуров on 24.11.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    var titlePost: String = ""

    private func setupView() {
            self.view.backgroundColor = .lightGray
            self.navigationItem.title = titlePost
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        let myButton = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(buttonAction))
        navigationItem.rightBarButtonItem = myButton
    }
    @objc func buttonAction() {
        let infoViewController = InfoViewController()
        self.present(infoViewController, animated: true, completion: nil)
    }
}
