//
//  InfoViewController.swift
//  Navigation
//
//  Created by Дубинкина Елена on 30/07/2021.
//  Copyright © 2021 Дубинкина Елена. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Info"
        
        
        let button = UIButton(frame: CGRect(x: 100, y: 300, width: 200, height: 50))
            button.setTitle("Press me...", for: .normal)
            button.setTitleColor(.darkGray, for: .normal)
        button.backgroundColor = .systemYellow
            button.addTarget(self, action: #selector(tap), for: .touchUpInside)
            view.addSubview(button)
        
            
        }
        @objc func tap() {
            let alertVC = UIAlertController(title: "Alert", message: "Are you sure?", preferredStyle: .alert)
            let firstAction = UIAlertAction(title: "OK", style: .default) {(action) -> Void in
                print("The user choose OK")
            }
            let secondAction = UIAlertAction(title: "Cancel", style: .default) {(action) -> Void in
                print("The user choose Cancel")
            }
            alertVC.addAction(firstAction)
            alertVC.addAction(secondAction)
            self.present(alertVC, animated: true, completion: nil)
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
