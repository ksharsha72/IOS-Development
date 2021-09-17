//
//  ViewController.swift
//  bill
//
//  Created by Sriharsha on 06/08/21.
//

import UIKit

class ViewController: UIViewController {
    
    var resultText = ""

    @IBOutlet weak var dinersTextField: UITextField!
    
    @IBOutlet weak var totalCostTextField: UITextField!
    
   
    @IBAction func helpClicked(_ sender: Any)
    {
        if let blankVC = storyboard?.instantiateViewController(withIdentifier: "nav"){
            present(blankVC, animated: true, completion: nil)
        }
        
        
        
        
      
    }
    
    //   @IBOutlet weak var resultLabel: UILabel!
//
//    @IBOutlet weak var rs: UILabel?
    
    @IBAction func dismissKeyBoard(_ sender: Any)
    {
        view.endEditing(true)
    }
    
    @IBAction func calculate(_ sender: Any) {
        
        if let dinerStr = dinersTextField.text,let totalStr = totalCostTextField.text
        {
           if let diner = Double(dinerStr) ,let total = Double(totalStr)
           {
            
            let formattedTotal = String(format: "%.2f", total/diner)
            let formattedCost = String(format: "%.2f",total)
//            resultLabel!.text = "\(total/diner)"
             resultText = "The total cost of the food is $\(formattedCost) \n\n Number of Diners: \(diner)\n\n each diner pays: $\(formattedTotal)"
            
           if total>100
           {
            performSegue(withIdentifier: "costly", sender: self)
           }
            
           else
           {
            performSegue(withIdentifier: "cheap", sender: self)
           }
            
            
            
           }
        }
        
        
      
    }
    
        
//        if let dinerStr = dinersTextField.text, let totalStr=totalCostTextField.text,
//           let diner = Double(dinerStr), let total = Double(totalStr)
//           {
//                resultLabel.text = "The total cost of food is \(total) \n\n Number of Diners: \(diner) \n\n Each Diner Pays: \(total/diner)"
//           }
//
//        if let dinerStr = dinersTextField.text,let totalStr = totalCostTextField.text
//        {
//           if let diner = Double(dinerStr) ,let total = Double(totalStr)
//           {
//
//            let formattedTotal = String(format: "%.2f", total/diner)
//            let formattedCost = String(format: "%.2f",total)
////            resultLabel!.text = "\(total/diner)"
////            rs?.text = "The total cost of the food is $\(formattedCost) \n\n Number of Diners: \(diner)\n\n each diner pays: $\(formattedTotal)"
////
//
//           }
//        }
        
//        let dinerValue = dinersTextField.text
//        let totalValue = totalCostTextField.text
//
//        if let dinerStr = dinerValue,let totalStr = totalValue{
//            print(dinerStr + totalStr)
//            let dinerDouble = Double(dinerStr)
//            let totalDouble = Double(totalStr)
//
//            if let diner = dinerDouble,let total = totalDouble
//            {
//                print(diner + total)
//            }
//        }
    
    
//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//
//        if let dinerStr = dinersTextField.text,let totalStr = totalCostTextField.text
//        {
//           if let diner = Double(dinerStr) ,let total = Double(totalStr)
//           {
//
//            let formattedTotal = String(format: "%.2f", total/diner)
//            let formattedCost = String(format: "%.2f",total)
////            resultLabel!.text = "\(total/diner)"
//             resultText = "The total cost of the food is $\(formattedCost) \n\n Number of Diners: \(diner)\n\n each diner pays: $\(formattedTotal)"
//
//            return true
//
//
//
//           }
//        }
//
//        return false
//
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {

        
        if let identifier  = segue.identifier
        {
            if identifier == "cheap"
            {
                let navController = segue.destination as! UINavigationController
                let destinationVC = navController.topViewController as! ResultViewController
//                let destinationVC = segue.destination as! ResultViewController
                destinationVC.finalText = resultText
            }
            
            else
            {
                let destination  = segue.destination as! CostlyViewController
                destination.finalTextCostly = resultText
//                destination.titleCostly = "Your Dinner Was Expensive"
            }
        }

        
      
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
   
    
    @IBAction func dismissVC(segue: UIStoryboardSegue)
    {
        
    }

   
    
}

