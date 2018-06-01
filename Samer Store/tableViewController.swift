//
//  tableViewController.swift
//  Samer Store
//
//  Created by Samer Masaad on 28/03/2018.
//  Copyright © 2018 epita. All rights reserved.
//

import UIKit

class tableViewController: UITableViewController {
    
    @IBOutlet var myTableView2: UITableView!
    
    var mealArray : [Meal] = []
    
    var clickedIndex : IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hard coded meals
        
        let meal1 = Meal(title: "Croissants", category:"Breakfast", description: "A croissant is a buttery, flaky, viennoiserie pastry named for its crescent shape. Croissants and other viennoiserie are made of a layered yeast-leavened dough. The dough is layered with butter, rolled and folded several times in succession, then rolled into a sheet, in a technique called laminating. The process results in a layered, flaky texture, similar to a puff pastry.", imageName: "meal1.jpg")
        
        let meal2 = Meal(title: "Orange Juice", category:"Breakfast, drinks", description: "Orange juice is the liquid extract of the fruit of the orange tree, produced by squeezing oranges. It comes in several different varieties, including blood orange, navel oranges, valencia orange, clementine, and tangerine. As well as variations in oranges used, some varieties include differing amounts of juice vesicles, known as \"pulp\" in American English, and \"juicy bits\" in British English. These vesicles contain the juice of the orange and can be left in or removed during the manufacturing process. How juicy these vesicles are depend upon many factors, such as species, variety, and season. In American English, the beverage name is often abbreviated as \"OJ\".", imageName: "meal2.jpg")
        
        let meal3 = Meal(title: "Meat Meal", category:"Lunch", description: "Beefy, bloody and bizarrely hard to get right, steak has an appeal far beyond the average piece of meat. Here, dedicated carnivore Mark Schatzker explains why he decided to travel the world in search of the primest cut", imageName: "meal3.jpg")
        
        let meal4 = Meal(title: "Fried Chicken", category:"Lunch", description: "Fried chicken (also referred to as Southern fried chicken for the variant in the United States) is a dish consisting of chicken pieces usually from broiler chickens which have been floured or battered and then pan-fried, deep fried, or pressure fried. The breading adds a crisp coating or crust to the exterior of the chicken. What separates fried chicken from other fried forms of chicken is that generally the chicken is cut at the joints, and the bones and skin are left intact. Crisp well-seasoned skin, rendered of excess fat, is a hallmark of well made fried chicken.", imageName: "meal4.jpg")
        
        let meal5 = Meal(title: "Ice Cream", category:"Dessert", description: "ce cream (derived from earlier iced cream or cream ice) is a sweetened frozen food typically eaten as a snack or dessert. It is usually made from dairy products, such as milk and cream, and often combined with fruits or other ingredients and flavors. It is typically sweetened with sugar or sugar substitutes. Typically, flavourings and colourings are added in addition to stabilizers. The mixture is stirred to incorporate air spaces and cooled below the freezing point of water to prevent detectable ice crystals from forming. The result is a smooth, semi-solid foam that is solid at very low temperatures (< 2 °C or 35 °F). It becomes more malleable as its temperature increases.", imageName: "meal5.jpg")
        
        let meal6 = Meal(title: "Cake", category:"Dessert", description: "Cake is a form of sweet dessert that is typically baked. In its oldest forms, cakes were modifications of breads, but cakes now cover a wide range of preparations that can be simple or elaborate, and that share features with other desserts such as pastries, meringues, custards, and pies.", imageName: "meal6.jpg")
        
        
        // fill the array
        
        mealArray.append(meal1)
        mealArray.append(meal2)
        mealArray.append(meal3)
        mealArray.append(meal4)
        mealArray.append(meal5)
        mealArray.append(meal6)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell

        // stroke effect
        let strokeTextAttributes: [NSAttributedStringKey : Any] = [
            NSAttributedStringKey.strokeColor : UIColor.black,
            NSAttributedStringKey.foregroundColor : UIColor.white,
            NSAttributedStringKey.strokeWidth : -4.0,
            ]
        
        // bold effect
        cell.titleLbl?.font = UIFont.boldSystemFont(ofSize: 30.0)
        cell.categoryLbl?.font = UIFont.boldSystemFont(ofSize: 25.0)
        
        // set attributes
        cell.titleLbl?.attributedText = NSAttributedString(string: mealArray[indexPath.row].title! ,attributes: strokeTextAttributes)
        cell.categoryLbl?.attributedText = NSAttributedString(string: mealArray[indexPath.row].category!, attributes: strokeTextAttributes)
        cell.bgImageView.image = UIImage(named: mealArray[indexPath.row].imageName!)
        
        // set cell border and shadow
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 40
        cell.layer.borderWidth = 5
        cell.layer.shadowOffset = CGSize(width: -1, height: 1)
        
        let borderColor = UIColor(red: 0.866, green: 0.956, blue: 1, alpha: 1.0)
        cell.layer.borderColor = borderColor.cgColor
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        clickedIndex = indexPath
        self.performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! detailViewController
        
        detailVC.meal = mealArray[clickedIndex!.row]
    }

}



class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var categoryLbl: UILabel!
    
}
