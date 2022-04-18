//
//  ViewController.swift
//  CoreDataLoginApp
//
//  Created by aravinthan t on 17/04/22.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    
    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var PassWord: UITextField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var Context : NSManagedObjectContext?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        Context = appDelegate.persistentContainer.viewContext
    }
    
    @IBAction func LoginButton(_ sender: UIButton)
    {
        guard let username = self.UserName.text, username != ""
        else {
            print ("username is empty")
            return
        }
        guard let password = self.PassWord.text, password != "" else {
            print ("password is empty")
            return
        }
        
        self.Fetch(username: username,password : password)
        
    }
    
    func Fetch(username : String,password : String){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "UserLogin")
        request.predicate = NSPredicate(format: "username = %@" ,username)
        request.predicate = NSPredicate(format: "password = %@" ,password)
        do{
            let results = try Context?.fetch(request)
            let count = results?.count
            if 0 < count! {
                for result in results! as! [NSManagedObject]{
                    if  let username = result.value(forKey: "username") as? String{
                        print("Username: \(username)")
                        let LoginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                        LoginVC.usernameText = username
                        self.present(LoginVC, animated: true, completion: nil)
                    }
                    
                }
            } else {
                print("Username and password are incorrect")
                
                let alert = UIAlertController(title: "Username and password are incorrect", message: "Enter correct credentials", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style:.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        catch{
        }
        
    }
    
    @IBAction func SignUpButton(_ sender: Any)
    {
        
    }
    
    
    
}



