//
//  ViewController.swift
//  Florists
//
//  Created by Sriharsha on 24/07/21.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var topLabel: UILabel!
    
    @IBOutlet weak var sampleButton: UIButton!
    
    @IBAction func facebookClicked(_ sender: Any) {
        
        topLabel.text="facebook info"
        infoLabel.text="this is our facebook information.you can find us at the following fb address"
    }
    
    
    @IBAction func twitterClicked(_ sender: Any) {
        print("twitter clicked")
        topLabel.text="twitter info"
        infoLabel.text="this is our twitter information.you can find us at the following fb address"
    }
    
    
    @IBAction func instagramClicked(_ sender: Any) {
        topLabel.text="Instagram info"
        infoLabel.text="this is our instagram information.you can find us at the following fb address"
    }
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        topLabel.text="buy from us"
        infoLabel.text="kkskjfjkbjksbkfjbfksbfkjsbjkbaskjfbjbfjkbfjabjkfbajbfjlablfjbalbfljabljfablfjblabflbalbflbflablfblkjsbfvkjsbvfjksvfkjvkfjvkjafvkavfkavfkjavfkjavfkjafvkjafvkjafvkjafvkjavfkjavkjvfakjvfkjavfkjvakjvfkjavfkjavkfvakvfk"
    }
    
    override func viewDidLoad() {
        
        topLabel.textColor = UIColor.yellow
        
        sampleButton.backgroundColor =
            UIColor.darkGray
    
//        let myImage=UIImageView()
//        myImage.frame=CGRect(x: 10, y: 70, width: 60, height: 60)
//        myImage.image=UIImage(named: "images")
//        myImage.contentMode = UIView.ContentMode.scaleAspectFill
//        myImage.center = CGPoint(x: self.view.frame.width/2, y: 80)
//
//        self.view.addSubview(myImage)
        
        
    }


}

