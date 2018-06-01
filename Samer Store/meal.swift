//
//  meals.swift
//  Samer Store
//
//  Created by Saner Masaad on 29/03/2018.
//  Copyright © 2018 epita. All rights reserved.
//

import Foundation

class Meal {
    
    var title : String?
    var category : String?
    var description : String?
    var imageName : String?
    
    init(title:String, category:String, description:String, imageName:String) {
        self.title = title
        self.category = category
        self.description = description
        self.imageName = imageName
    }
}
