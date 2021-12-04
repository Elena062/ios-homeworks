//
//  Photos.swift
//  Navigation
//
//  Created by Дубинкина Елена on 05/11/2021.
//  Copyright © 2021 Дубинкина Елена. All rights reserved.
//

import UIKit


public var photoGallery = [UIImage]()

func setGallery() {
   for idx in 0...19 {
        print(idx)
        let name = "image" + String(idx)
    print(name)
    photoGallery.insert(UIImage(named: name)!, at: idx)
    }
    print(photoGallery.count)
}
