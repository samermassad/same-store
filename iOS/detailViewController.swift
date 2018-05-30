//
//  detailViewController.swift
//  Samer Store
//
//  Created by Samer Masaad on 29/03/2018.
//  Copyright © 2018 epita. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {

    var meal : Meal?
    
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var txtDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblTitle.text = (meal?.title)!
        lblCategory.text = "Category: " + (meal?.category)!
        txtDescription.text = (meal?.description)!
        
        let image = UIImage(named: (meal?.imageName)!)
        mealImage.image = image
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
