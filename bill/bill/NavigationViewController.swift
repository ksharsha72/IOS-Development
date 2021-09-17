//
//  NavigationViewController.swift
//  bill
//
//  Created by Sriharsha on 11/08/21.
//

import UIKit

class NavigationViewController: UIViewController {
    
    
    @IBAction func finishClicked(_ sender: Any)
    {
        if let navController = navigationController
        {
            navigationController?.popToRootViewController(animated: true)
        }
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
