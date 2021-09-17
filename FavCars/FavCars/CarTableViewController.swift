//
//  CarTableViewController.swift
//  FavCars
//
//  Created by Sriharsha on 14/08/21.
//

import UIKit

var namesArray = [String]()
var imagesArray = [UIImage]()
class CarTableViewController: UITableViewController {
    
    var name = ""
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return namesArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "carCell", for: indexPath) as! CarTableViewCell
        
     
        
//        let carImgView = cell.viewWithTag(10) as! UIImageView
//        carImgView.image = imagesArray[indexPath.row]
//        carImgView.layer.cornerRadius = 10
//        carImgView.clipsToBounds = true
        
        cell.carImgView.image = imagesArray[indexPath.row]
        cell.numberLable.text = "\(indexPath.row + 1)"
        cell.titleLable.text = namesArray[indexPath.row]
        
//        cell.carImgView.layer.cornerRadius = 10
//        cell.carImgView.clipsToBounds = true
//        
//        let backLable = cell.viewWithTag(11) as! UILabel
//        backLable.layer.cornerRadius = 10
//        backLable.layer.borderColor = UIColor.darkGray.cgColor
//        backLable.layer.borderWidth = 3
//        backLable.clipsToBounds = true

        // Configure the cell...
//
//        let numberLable = cell.viewWithTag(12) as! UILabel
//        numberLable.layer.cornerRadius = 17.5
//        numberLable.layer.borderColor = UIColor.black.cgColor
//        numberLable.layer.borderWidth = 3
//        numberLable.clipsToBounds = true
//        cell.numberLable.text = "\(indexPath.row + 1)"
        
//        let titleLable = cell.viewWithTag(13) as! UILabel
//        titleLable.layer.cornerRadius = 10
//        titleLable.layer.borderColor = UIColor.darkGray.cgColor
//        titleLable.layer.borderWidth = 3
//        titleLable.clipsToBounds = true
//        cell.titleLable.text = namesArray[indexPath.row]
//
        return cell
    }
    

    @IBAction func load(_ sender: Any) {
        
        namesArray = ["BMW","NEW MAYBACH","RANGE ROVER"]
        imagesArray = [UIImage(named:"car1")!,UIImage(named:"car2")!,UIImage(named:"car3")!]
        
        tableView.reloadData()
        
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            namesArray.remove(at: indexPath.row)
            imagesArray.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
        
        else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        print("row selected")
        name = namesArray[indexPath.row]
        performSegue(withIdentifier: "identifier", sender: self)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let myIndexPath =  tableView.indexPathForSelectedRow
//        {
//            let name = namesArray[myIndexPath.row]
//            let image = imagesArray[myIndexPath.row]
//            
//            let destVC =  segue.destination as! AddCarViewController
//            destVC.
//        }
//    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
