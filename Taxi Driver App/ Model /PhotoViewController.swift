//
//  PhotoViewController.swift
//  Taxi Driver App
//
//  Created by user on 29.05.2021.
//

import UIKit

class PhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var image = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()
    

        // Do any additional setup after loading the view.
    }
    func getImage() -> UIImage {
        return image
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let data = convertFromUIImagetoDict(info)
        if let editingImage = data[convertInfoKey((UIImagePickerController.InfoKey.editedImage))] as? UIImage {
            self.image = editingImage
            //self.profilFotoImage.image = editingImage
        }
       self.dismiss(animated: true, completion: nil)
        
    }
    
     func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
  
    func convertFromUIImagetoDict(_ input: [UIImagePickerController.InfoKey : Any]) -> [String : Any] {
        return Dictionary(uniqueKeysWithValues: input.map({ key, value in (key.rawValue,value)}))
    }
    
    func convertInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
        return input.rawValue
    }

}

