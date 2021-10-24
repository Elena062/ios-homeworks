//
//  File.swift
//  Navigation
//
//  Created by Дубинкина Елена on 25/10/2021.
//  Copyright © 2021 Дубинкина Елена. All rights reserved.
//

import UIKit

struct Post {
    
    let author: String
    let description: String
    let image: String
    var likes: Int
    var views: Int
    
}

struct Feed {
    
    static let post = [Post(author: "Hermiona", description: "Посмотрите во что я превратилась", image: "hermiona", likes: 10, views: 20), Post(author: "Ron&Harry", description: "Гермиона, держись! Мы спасем тебя! Но если не получится, помни, мы любим тебя любую :)", image: "harryron", likes: 5, views: 7), Post(author: "Polumna", description: "Всё пройдет, и это тоже.... Главное, пятки на ночь йодом намажь!", image: "iod", likes: 20, views: 20), Post(author: "Harfild", description: "У нас с тобой есть нечто общее....", image: "garfild", likes: 3, views: 3)]    
}
