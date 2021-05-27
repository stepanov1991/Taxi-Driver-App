//
//  Registration2ViewController.swift
//  Taxi Driver App
//
//  Created by user on 08.05.2021.
//

import UIKit

class Registration2ViewController: UIViewController {
    
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var carPhotoTableView: UITableView!
    
    
    let titleArray = ["Спереду", "Ззаду" ,"Збоку" ,"В салоні"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        carPhotoTableView.dataSource = self
        carPhotoTableView.delegate = self
        
        carPhotoTableView.register(UINib(nibName: "PhotoCell", bundle: nil), forCellReuseIdentifier: "PhotoCell")
        
        backButton.layer.cornerRadius = 10
        backButton.layer.borderWidth = 1.0
        backButton.layer.borderColor = UIColor.black.cgColor
        nextButton.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    

}
extension Registration2ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! photoCell
        cell.titleLabel.text = titleArray[indexPath.row]
        return cell
    }
    
    
}
