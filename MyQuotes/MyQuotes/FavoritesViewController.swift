//
//  FavoritesViewController.swift
//  MyQuotes
//
//  Created by Sriharsha on 12/08/21.
//

import UIKit

class FavoritesViewController: UIViewController {

    let defaults = UserDefaults.standard
    @IBOutlet weak var favoriteImageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        view.backgroundColor = theme
        
        let savingDefaults = UserDefaults.standard
        
        let indexSaved = savingDefaults.integer(forKey: "favorite")
        
        let imageName = indexSaved

        let image =  UIImage(named: String(imageName))
        
        favoriteImageView.image = image
        
        let themeValue = defaults.integer(forKey: "theme")
        
        if themeValue == 0
        {
            view.backgroundColor = UIColor.black
        }
        else
        {
            view.backgroundColor = UIColor.white
        }
        
        if imgBorder
        {
            favoriteImageView.layer.borderColor = UIColor.red.cgColor
            favoriteImageView.layer.borderWidth = 5.0
        }
        else
        {
           favoriteImageView.layer.borderWidth = 0
        }
        
        favoriteImageView.clipsToBounds = true
        favoriteImageView.layer.cornerRadius = 150.0
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
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
