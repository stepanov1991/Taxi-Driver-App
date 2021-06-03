//
//  MainViewController.swift
//  Taxi Driver App
//
//  Created by user on 02.06.2021.
//

import UIKit

@available(iOS 13.0, *)
class MainViewController: UIViewController {

  
    @IBOutlet weak var launchView: UIView!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var playStopButton: UIButton!
    {
        didSet {
//            let playImage = UIImage(named: "playIcon.png")
//            playStopButton.setImage(, for: .normal)
//            let stopImage = UIImage(named: "stopIcon.png")
//            playStopButton.setImage(stopImage, for: .selected)
            
          
            playStopButton.setImage(UIImage(systemName: "play"), for: .normal)
            playStopButton.setImage(UIImage(systemName: "pause"), for: .selected)
           
        }
    }
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func playStopButtonPressed(_ sender: UIButton) {
     //   sender.setImage(UIImage(named: "stopIcon"), for: .normal)
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
