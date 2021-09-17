//
//  HomeViewController.swift
//  MyQuotes
//
//  Created by Sriharsha on 12/08/21.
//

import UIKit

var theme:UIColor = UIColor.black
var imgBorder = false
var defaults = UserDefaults.standard

class HomeViewController: UIViewController {
    
    
    @IBOutlet var homeButtons: [UIButton]!
    
    let defaults = UserDefaults.standard
    
    var quoteArray = [String]()
    var arrayIndex = 0
    @IBOutlet weak var quoteImageView: UIImageView!
    
  
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        let themeValue = defaults.integer(forKey: "theme")
        
        if themeValue == 0
        {
            view.backgroundColor = UIColor.black
            setButtonBorders(color: .white)
        }
        else
        {
            view.backgroundColor = UIColor.white
            setButtonBorders(color: .black)
        }
        if imgBorder
        {
            quoteImageView.layer.borderColor = UIColor.red.cgColor
            quoteImageView.layer.borderWidth = 5.0
        }
        else
        {
            quoteImageView.layer.borderWidth = 0
        }
        
        quoteImageView.layer.cornerRadius = 5.0
        
        
        
        
   
       
    }
    
    
    
    @IBAction func backClicked(_ sender: Any)
    {
        if arrayIndex > 0
        {
            
            arrayIndex-=1
            
            let index = quoteArray[arrayIndex]
            let image = UIImage(named: index)
            quoteImageView.image = image
            
        }
        
        
    }
    
    func setButtonBorders(color:UIColor)
    {
        for button in homeButtons
        {
            button.layer.cornerRadius = 25.0
            button.layer.borderWidth = 3.5
            button.layer.borderColor = color.cgColor
        }
    }
    
    
    @IBAction func nextClicked(_ sender: Any)
    {
        if arrayIndex < quoteArray.count-1
        {
            arrayIndex+=1
            let index = quoteArray[arrayIndex]
            let quoteimage = UIImage(named: index)
            quoteImageView.image = quoteimage
        }
    }
    
    
    @IBAction func favoriteClicked(_ sender: Any)
    {
        let savingDefaults = UserDefaults.standard
        
        savingDefaults.set(arrayIndex, forKey: "favorite")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0..<9
        {
            quoteArray.append(String(i))
        }

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
