//
//  Registraiton1ViewController.swift
//  Taxi Driver App
//
//  Created by user on 08.05.2021.
//

import UIKit

class Registraiton1ViewController: UIViewController {
    
    @IBOutlet weak var profilFotoImage: UIImageView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        
     let backBarButton = UIImage(named: "back")
        self.navigationController?.navigationBar.backIndicatorImage = backBarButton
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backBarButton
      //  self.navigationController?.navigationBar.backItem?.title = nil
        self.navigationController?.navigationBar.backItem?.backButtonTitle = ""
        self.title = "Реєстрація"
        
       
        
        // make circle image
    
        profilFotoImage.layer.masksToBounds = false
        profilFotoImage.layer.cornerRadius = profilFotoImage.frame.height/2
        profilFotoImage.clipsToBounds = true
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
     
     
        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.title = ""
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
