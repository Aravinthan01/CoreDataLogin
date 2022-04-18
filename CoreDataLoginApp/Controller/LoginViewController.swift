//
//  LoginViewController.swift
//  CoreDataLoginApp
//
//  Created by aravinthan t on 18/04/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameLabel: UILabel!
    var usernameText = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.usernameLabel.text = "Welcome \(usernameText)"
        
    }
    
    @IBAction func LogoutButton(_ sender: UIButton) {
        let back = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.present(back, animated: true, completion: nil)
        
    }
    
}
