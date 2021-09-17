//
//  DetailsViewController.swift
//  WorkOutGuide
//
//  Created by Sriharsha on 13/08/21.
//

import UIKit

class DetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appDelegate.printValue()
        
        self.view.backgroundColor = appColor
        
        let imgView = view.viewWithTag(6) as! UIImageView
        let workoutImage = UIImage(named: detailsArray[0])
        imgView.image = workoutImage
        
        imgView.layer.borderWidth = 4
//        imgView.layer.borderColor = UIColor(red: 0.87, green: 0.53, blue: 0.50, alpha: 1.00).cgColor
        
        imgView.layer.borderColor = appColor.cgColor
                
        
        
        
        let descTextView = view.viewWithTag(7) as! UITextView
        descTextView.text = detailsArray[1]
        descTextView.textColor = UIColor.black
        descTextView.font = UIFont(name:"AvenirNext-Regular",size: 21)
        
        let button = view.viewWithTag(5) as! UIButton
        button.setTitleColor(UIColor.white, for: .normal)
        

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
