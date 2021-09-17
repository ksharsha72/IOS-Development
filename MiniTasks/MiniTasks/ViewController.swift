//
//  ViewController.swift
//  MiniTasks
//
//  Created by Sriharsha on 13/08/21.
//

import UIKit

var tasksArray = [String]()
var datesArray = [String]()

class ViewController: UIViewController,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var addButton: UIButton!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        
        addButton.layer.cornerRadius = 25
        addButton.clipsToBounds = true
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        
        cell.textLabel?.text = "\(indexPath.row). \(tasksArray[indexPath.row+1])"
        cell.detailTextLabel?.text = datesArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksArray.count
    }
    
  
    
    @IBAction func close(segue: UIStoryboardSegue)
    {
        
    }
    


}

