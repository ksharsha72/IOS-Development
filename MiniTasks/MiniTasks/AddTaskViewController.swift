//
//  AddTaskViewController.swift
//  MiniTasks
//
//  Created by Sriharsha on 14/08/21.
//

import UIKit

class AddTaskViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var addTaskButton: UIButton!
    
    @IBOutlet weak var pickerView: UIPickerView!
    var dateFormatter  = DateFormatter()
    var selectedTask = ""
    
    var tasks = ["Select task","Go to dentist","Meet Friends","Iron my clothes","Call Parents","Pay bills","Paint desk","Call insurance company","Cook dinner","Buy gifts for wife","Take kids out","Go for swimming lesson","Play tennis","Clean the house","Track Package"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.dataSource = self
        pickerView.delegate = self
        addTaskButton.isEnabled = false
        datePicker.minimumDate = Date()
        dateFormatter.dateFormat = "EE dd-MM-yyyy HH:mm"
        addTaskButton.layer.cornerRadius = 5
        addTaskButton.layer.borderWidth = 1.0
        addTaskButton.layer.borderColor = UIColor.white.cgColor
        addTaskButton.clipsToBounds = true
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tasks.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tasks[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
       if row == 0
       {
        addTaskButton.isEnabled=false
       }
       else{
        addTaskButton.isEnabled=true
//       tasksArray.append(tasks[row])
//        print(tasksArray)
        selectedTask = tasks[row]
       }
        
        
    }
    
    
    @IBAction func addTask(_ sender: Any) {
            
        let date = datePicker.date
        let dateStr = dateFormatter.string(from: date)
        tasksArray.append(selectedTask)
        datesArray.append(dateStr)
        
        print(tasksArray)
        print(datesArray)
     
      dismiss(animated: true, completion: nil)
            
        
    }
    
    

 
}
