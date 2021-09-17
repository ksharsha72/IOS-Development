//
//  ResultViewController.swift
//  bill
//
//  Created by Sriharsha on 09/08/21.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    var finalText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        resultLabel.text = finalText
    }
    
//
//    @IBAction func close(_ sender: Any) {
//        dismiss(animated: true, completion: nil)
//    }
    
}
