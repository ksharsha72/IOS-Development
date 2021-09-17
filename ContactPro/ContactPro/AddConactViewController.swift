//
//  AddConactViewController.swift
//  ContactPro
//
//  Created by Sriharsha on 18/08/21.
//

import UIKit

class AddConactViewController: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var contactImgView: UIImageView!
    
 
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameTextField.delegate = self
        phoneTextField.delegate = self
        
        nameTextField.becomeFirstResponder()
        
        rounded(view: nameTextField, radius: 5)
        rounded(view: phoneTextField, radius: 5)
        rounded(view: contactImgView, radius: 50)
    }
    
    func rounded(view: UIView, radius: CGFloat)
    {
        view.layer.cornerRadius = radius
        view.layer.borderColor = UIColor(red:0.27,green:0.69,blue: 0.60,alpha: 1).cgColor 
        
        view.layer.borderWidth = 3
        view.clipsToBounds = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        phoneTextField.resignFirstResponder()
        
        return true
    }
    
    @IBAction func selectPhoto(_ sender: Any)
    {
        let picker = UIImagePickerController()
        picker.allowsEditing =  true
        picker.delegate = self
        picker.sourceType = .photoLibrary
        
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.editedImage]
        contactImgView.image = image as? UIImage
        
        dismiss(animated: true)
        
    }
    
    @IBAction func save(_ sender: Any)
    {
        if (nameTextField.text?.isEmpty)! || (phoneTextField.text?.isEmpty)! || contactImgView.image == nil
        {
            let alert = UIAlertController(title: "All Required", message: "Please provide a name,phone number and image in order to continue", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "ok", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert,animated: true)
            
            return 
        }
        
        let name = nameTextField.text!
        let phone = phoneTextField.text!
        let imageName = name.removeSpaces()
        let randomInt = arc4random_uniform(1000)
        let finalImageName = "\(imageName) \(randomInt)"
        
        let newContact = Contact(name: name, phone: phone, imageName: finalImageName)
        contactsArray.insert(newContact, at: 0)
        
        let archivedData = NSKeyedArchiver.archivedData(withRootObject: contactsArray)
        
        UserDefaults.standard.set(archivedData,forKey: "contacts")
        
       
        
        let image = contactImgView.image!
        if let jpgImage = image.jpegData(compressionQuality: 0.8)
        {
            
            let urlPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            
            print(urlPath)
            
            let directory = urlPath[0]
            
            let imagePath = directory.appendingPathComponent(finalImageName)
            
            try? jpgImage.write(to: imagePath)
            
        }
        
        
    }
    
    func sriharsha() -> String
    {
        let hello:String = " hello"
        var sri = 10
        sri = sri + 1
        
    var x = "harsha"
        
        var t = hello + x
        print(t)
   
        
        
        return "sri harsha"
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
