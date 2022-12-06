//
//  LogInViewController.swift
//  Navigation
//
//  Created by Владимир Винокуров on 06.12.2022.
//

import UIKit

class LogInViewController: UIViewController {

    let logInView = UIView(frame: .zero)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view.addSubview(logInView)
        self.navigationController?.navigationBar.isHidden = false
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
