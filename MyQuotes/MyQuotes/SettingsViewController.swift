//
//  SettingsViewController.swift
//  MyQuotes
//
//  Created by Sriharsha on 12/08/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
   
    @IBOutlet weak var switchBorder: UISwitch!
    @IBOutlet var setttingLabels: [UILabel]!
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var segmenttedTheme: UISegmentedControl!
    
    @IBAction func segmentedChanged(_ sender: Any)
    {
        let index = segmenttedTheme.selectedSegmentIndex
        
        defaults.set(index, forKey:"theme")
        
        if index==0
        {
            theme = UIColor.black
            changeTheme(color: UIColor.white)
            
        }
        else
        {
            theme = UIColor.white
            changeTheme(color: UIColor.black)
            
            
        }
        
        view.backgroundColor = theme
    }
    
    @IBAction func switchChanged(_ sender: Any)
    {
        if switchBorder.isOn
        {
            imgBorder = true
        }
        else
        {
            imgBorder = false
        }
    }
    
    @IBOutlet weak var stepperFavorite: UIStepper!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view.backgroundColor = theme
        let themeValue = defaults.integer(forKey: "theme")
        if themeValue == 0
        {
            view.backgroundColor = UIColor.black
            changeTheme(color: UIColor.white)
        }
        else
        {
            view.backgroundColor = UIColor.white
            changeTheme(color: UIColor.black)
        }
    }
    
    func changeTheme(color:UIColor){
        
        for label in setttingLabels
        {
            label.textColor = color
        }
        
        segmenttedTheme.tintColor = color
        stepperFavorite.tintColor = color
        switchBorder.onTintColor = color
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
