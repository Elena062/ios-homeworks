//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Дубинкина Елена on 29/07/2021.
//  Copyright © 2021 Дубинкина Елена. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Profile"
        

       let image = UIImage(named: "cat_avatar")
       let photoImageView = UIImageView(frame: CGRect(x: 10, y: 100, width: 200, height: 250))
        photoImageView.image = image
        
        view.addSubview(photoImageView)
        
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
