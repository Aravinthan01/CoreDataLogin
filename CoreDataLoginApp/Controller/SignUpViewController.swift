//
//  SignUpViewController.swift
//  CoreDataLoginApp
//
//  Created by aravinthan t on 18/04/22.
//

import UIKit
import CoreData

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var PassWord: UITextField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var Context : NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Context = appDelegate.persistentContainer.viewContext
        
    }
    
    @IBAction func SignUpButton(_ sender: Any) {
        
        guard let username = self.UserName.text, username != ""
        else {
            print ("username is empty")
            return
        }
        guard let password = self.PassWord.text, password != "" else {
            print ("password is empty")
            return
        }
        self.Save(username: username, password: password)
        
        
        
    }
    func Save(username : String, password : String)  {
        let login = NSEntityDescription.insertNewObject(forEntityName: "UserLogin", into: Context!)
        login.setValue(username, forKey: "username")
        login.setValue(password, forKey: "password")
        do{
            try Context?.save()
            print("Signup successfully")
            let alert = UIAlertController(title: "Signup Successfully", message: "Try to Login", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style:.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
        }catch{
            print("error")
        }
    }
    
    
    
    
}
