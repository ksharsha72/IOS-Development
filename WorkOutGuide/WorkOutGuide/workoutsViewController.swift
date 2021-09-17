//
//  CustomViewController.swift
//  WorkOutGuide
//
//  Created by Sriharsha on 13/08/21.
//

import UIKit

var detailsArray = [String]()

class workoutsViewController: UIViewController {
    
    var workoutDict = [String:[String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        
        appDelegate.printValue()
        
        self.title = "choose workout"
        
        let  path = Bundle.main.path(forResource: "WorkOuts", ofType: "plist")

        if let validPath = path
        {
            let dict = NSDictionary(contentsOfFile: validPath)

            if let validDict = dict
            {
                workoutDict = validDict as! [String:[String]]
                print(validDict)
                
                let titleArrays = validDict.allKeys
                let allView = view.subviews
//                for singleView in allView
                for i in 0..<allView.count
                {
//                    if singleView .tag == 10//is UIButton
                    if allView[i].tag == 10
                    {
//                        let button = singleView as! UIButton
                        let button = allView[i] as! UIButton
        //                button.backgroundColor = UIColor(red: 0.87, green: 0.53, blue: 0.50, alpha: 1.00)
                        button.setTitle(titleArrays[i] as? String, for: .normal)
//                        button.setTitleColor(UIColor(red: 0.87, green: 0.53, blue: 0.50, alpha: 1.00), for: .normal)
                        button.setTitleColor(appColor, for: .normal)
                        
                        button.titleLabel?.textColor = UIColor.white
//                        button.titleLabel?.font = UIFont(name: "HelveticaNeue-CondensedBold", size:20 )
                        button.titleLabel?.font = UIFont(name: buttonFont, size:20 )
//                        button.layer.borderColor = UIColor(red: 0.87, green: 0.53, blue: 0.50, alpha: 1.00).cgColor
                        button.layer.borderColor = appColor.cgColor
                        
                        button.layer.borderWidth = 1.5
                        
                        button.layer.cornerRadius = 5
                        button.clipsToBounds = true
                        
                        button.addTarget(self, action: #selector(workoutsViewController.goToDetails(sender:)), for: .touchUpInside)
                    }
                }
            }
        }
        
        

       
    }
    
    @objc func goToDetails(sender: UIButton)
    {
        if let title = sender.titleLabel?.text,let array = workoutDict[title]
        {
            detailsArray = array
            performSegue(withIdentifier: "details", sender: self)
        }
    }
  
    @IBAction func close(segue: UIStoryboardSegue)
    {
        
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
