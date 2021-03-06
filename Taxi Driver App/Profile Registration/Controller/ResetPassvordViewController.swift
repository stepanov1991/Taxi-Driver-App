//
//  ResetPassvordViewController.swift
//  Taxi Driver App
//
//  Created by user on 01.06.2021.
//

import UIKit

class ResetPassvordViewController: UIViewController {
    
    @IBOutlet weak var resetPasswordButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetPasswordButton.layer.cornerRadius = 10
        
        let backBarButton = UIImage(named: "back")
        self.navigationController?.navigationBar.backIndicatorImage = backBarButton
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backBarButton
        self.title = "Відновити пароль"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.cyan]
        
    }
}
