//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Владимир Винокуров on 23.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    let mainView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view.addSubview(mainView)
        mainView.addSubview()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        mainView.frame = CGRect(x: 0, y: 100, width: Int(self.view.frame.width), height: Int(self.view.frame.height))
        mainView.backgroundColor = .lightGray
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
    }
}
