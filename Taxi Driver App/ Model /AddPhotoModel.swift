////
////  AddPhotoModel.swift
////  Taxi Driver App
////
////  Created by user on 29.05.2021.
////
//
//import UIKit
//import AVFoundation
//import MobileCoreServices
//
//protocol AddPhoto: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//
//}
//
//class PhotoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//
//    func actionSheet() {
//        let alert = UIAlertController(title: "Chose photo", message: nil, preferredStyle: .actionSheet)
//        alert.addAction(UIAlertAction(title: "Open camera", style: .default, handler: { (handler) in
//            self.openCamera()
//
//
//        }))
//        alert.addAction(UIAlertAction(title: "Chose from gallery", style: .default, handler: { (handler) in
//            self.openGallery()
//
//
//        }))
//        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (handler) in
//
//        }))
//        self.present(alert, animated: true, completion: nil)
//    }
//    func openCamera() {
//        if UIImagePickerController.isSourceTypeAvailable(.camera){
//            let image = UIImagePickerController()
//            image.allowsEditing = true
//            image.delegate = self
//            image.sourceType = .camera
//            image.mediaTypes = [kUTTypeImage as String]
//            self.present(image, animated: true, completion: nil)
//
//        }
//    }
//
//    func openGallery()  {
//        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
//            let image = UIImagePickerController()
//            image.allowsEditing = true
//            image.delegate = self
//            self.present(image, animated: true, completion: nil)
//
//        }
//    }
//}
//
//
//
