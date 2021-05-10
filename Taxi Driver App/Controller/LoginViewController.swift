//
//  LoginViewController.swift
//  Taxi Driver App
//
//  Created by user on 01.05.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkBox: UIButton!{
        didSet{
            checkBox.setImage(UIImage(named: "unchecked"), for: .normal)
            checkBox.setImage(UIImage(named: "checked"), for: .selected)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        self.passwordTextField.delegate = self
        self.loginTextField.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showPasswordButtonPressed(_ sender: Any) {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    @IBAction func checkBoxPressed(_ sender: UIButton) {
        sender.checkBoxAnimation {
            print("I'm done")
            //here you can also track the Checked, UnChecked state with sender.isSelected
            print(sender.isSelected)
        }
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        _ = self.navigationController?.popToRootViewController(animated: true)
    }
    
    //MARK: - TextField Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passwordTextField.resignFirstResponder()
        loginTextField.resignFirstResponder()
        return true
        
    }
}
extension UIButton {
    func checkBoxAnimation(closure: @escaping () -> Void)  {
        guard let image = self.imageView else {return}
        
        UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear) {
            image.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        } completion: { success in
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
                self.isSelected = !self.isSelected
                closure()
                image.transform = .identity
            }, completion: nil)
            
        }
        
    }
    
    
}


