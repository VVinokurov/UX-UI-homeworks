//
//  InfoViewController.swift
//  Navigation
//
//  Created by Владимир Винокуров on 24.11.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        let buttonInfo = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
        buttonInfo.backgroundColor = .systemBlue
        buttonInfo.setTitle("IKEA покинула нас", for: .normal)
        buttonInfo.addTarget(self, action: #selector(buttonAlert), for: .touchUpInside)
        self.view.addSubview(buttonInfo)

        // Do any additional setup after loading the view.
    }
    @objc func buttonAlert () {
        let alert = UIAlertController(title: "Вы любили покупать товары в IKEA?", message: "выберете ответ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Да", style: .default, handler: { action in
            print("Теперь их больше не купить")
        }))
        alert.addAction(UIAlertAction(title: "Нет", style: .cancel, handler: { action in
            print("Значит для вас ничего не изменилось")
        }))
        self.present(alert, animated: true)
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
