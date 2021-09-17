//
//  CostlyViewController.swift
//  bill
//
//  Created by Sriharsha on 09/08/21.
//

import UIKit

class CostlyViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var finalTextCostly = ""
    var titleCostly = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = finalTextCostly
        titleLabel.text = titleCostly

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
