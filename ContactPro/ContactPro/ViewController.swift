//
//  ViewController.swift
//  ContactPro
//
//  Created by Sriharsha on 18/08/21.
//

import UIKit

var contactsArray = [Contact]()
class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var contactImgView: UIImageView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        let unarchivedData = UserDefaults.standard.object(forKey: "contacts") as? Data
        
        if let unarchivedData = unarchivedData
        {
            contactsArray = NSKeyedUnarchiver.unarchiveObject(with: unarchivedData) as! [Contact]
            
            if contactsArray.count>0
            {
                let singleContact = contactsArray[0]
                nameLabel.text = singleContact.name
                phoneLabel.text = singleContact.phone
                let imagepath = imagePath(imageName: singleContact.imageName)
                let image = UIImage(contentsOfFile: imagepath.path)
                contactImgView.image = image
                
                
            }
            
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        // Do any additional setup after loading the view.
        
//        let contact1 = Contact(name: "Sri", phone: "12345", imageName: "imageName")
//
//        let contact2 = Contact(name: "Govind", phone: "6789", imageName: "anotherimage")
//
//        contactsArray.append(contact1)
//        contactsArray.append(contact2)
//
//        UserDefaults.standard.set(contactsArray, forKey: "contact")
        
       
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return contactsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "contactCell", for: indexPath)
        
        let imgView = cell.viewWithTag(10) as! UIImageView
        
        let contact = contactsArray[indexPath.row]
        let imageName = contact.imageName
        let imagepath = imagePath(imageName: imageName)
        
        let image = UIImage(contentsOfFile: imagepath.path)
        imgView.image = image
        
        
        
        imgView.layer.borderColor = UIColor.white.cgColor
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let contact = contactsArray[indexPath.row]
        let imageName = contact.imageName
        let phone = contact.phone
        let name = contact.name
        let imagepath = imagePath(imageName: imageName)
        let image = UIImage(contentsOfFile: imagepath.path)
        
        nameLabel.text = name.uppercased()
        phoneLabel.text = phone
        contactImgView.image = image
    }
    
    
    func imagePath(imageName:String) -> URL
    {
        let urlPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        
        
        let directory = urlPath[0]
        
        let imagePath = directory.appendingPathComponent(imageName)
        
        return imagePath
    }


}

