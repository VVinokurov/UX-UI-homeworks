//
//  PostViewController.swift
//  Navigation
//
//  Created by Владимир Винокуров on 24.11.2022.
//

import UIKit

class PostViewController: UIViewController {

    private func setupView() {
            self.view.backgroundColor = .lightGray
            self.navigationItem.title = "Мой пост"
            self.navigationController?.navigationBar.prefersLargeTitles = true
            //self.navigationItem.rightBarButtonItem = button
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
