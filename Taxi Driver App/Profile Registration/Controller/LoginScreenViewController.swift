//
//  ViewController.swift
//  Taxi Driver App
//
//  Created by user on 01.05.2021.
//

import UIKit

class LoginScreenViewController: UIViewController {
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 10
        registerButton.layer.borderWidth = 1.0
        registerButton.layer.borderColor = UIColor.black.cgColor
        registerButton.layer.cornerRadius = 10
        
        self.title = ""
   
        
        // Do any additional setup after loading the view.
    }
    
  

    @IBAction func loginButtonPressed(_ sender: UIButton) {
    }
    @IBAction func registerButtonPressed(_ sender: UIButton) {
    }
    
}

