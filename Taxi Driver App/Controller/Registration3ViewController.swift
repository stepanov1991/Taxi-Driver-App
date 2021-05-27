//
//  Registration3ViewController.swift
//  Taxi Driver App
//
//  Created by user on 27.05.2021.
//

import UIKit

class Registration3ViewController: UIViewController {

    @IBOutlet weak var documentsFotoTableView: UITableView!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    
    let documentArray = ["Сторона 1","Сторона 2"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        documentsFotoTableView.dataSource = self
        documentsFotoTableView.delegate = self

        documentsFotoTableView.register(UINib(nibName: "PhotoCell", bundle: nil), forCellReuseIdentifier: "PhotoCell")
        
        backButton.layer.cornerRadius = 10
        backButton.layer.borderWidth = 1.0
        backButton.layer.borderColor = UIColor.black.cgColor
        
        sendButton.layer.cornerRadius = 10
        
        
        
    }
    
    
    

}
extension Registration3ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! photoCell
        cell.titleLabel.text = documentArray[indexPath.row]
        return cell
    }
    
    
}
