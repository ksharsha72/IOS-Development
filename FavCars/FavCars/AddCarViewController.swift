//
//  AddCarViewController.swift
//  FavCars
//
//  Created by Sriharsha on 14/08/21.
//

import UIKit

class AddCarViewController: UIViewController, UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var carImageView: UIImageView!
    
    @IBOutlet weak var characterCountLabel: UILabel!
    @IBOutlet weak var selectCarButton: UIButton!
    let photoPicker = UIImagePickerController()
    
    var imagePicked = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "ADD NEW CAR"
        
        nameTextField.delegate = self
        photoPicker.delegate = self
        photoPicker.allowsEditing = true
        
        nameTextField.layer.cornerRadius = 10
        
        selectCarButton.layer.cornerRadius = 10

        // Do any additional setup after loading the view.
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let length = textField.text?.count
        {
            characterCountLabel.text = "\(length + 1) characters so far"
        }
        return true
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            imagePicked = true
            carImageView.image = selectedImage
            imagesArray.insert(selectedImage, at: 0)
        }
        
        dismiss(animated: true)
        
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        
        return true
    }
    @IBAction func selectCar(_ sender: Any) {
//        let photoPicker = UIImagePickerController()
//        photoPicker.delegate = self
//        photoPicker.allowsEditing = true
        
        present(photoPicker, animated: true)
    }
    
    @IBAction func saveCar(_ sender: Any) {
        if !imagePicked
        {
            print("there is no image")
            return
        }
        
        if (nameTextField.text?.isEmpty)!
        {
            print("text empty")
            return
        }
        
        if let value = nameTextField.text
        {
            namesArray.insert(value, at: 0)
            
            if let navController = navigationController
            {
                navController.popViewController(animated: true)
            }
        }
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
