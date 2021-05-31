//
//  DropDownManager.swift
//  Taxi Driver App
//
//  Created by user on 31.05.2021.
//

import DropDown
import UIKit

class DropDownManager {
    
    let dropDown = DropDown()
    
    func addDropDown(textDropDown: UILabel, viewDropDown: UIView, listDropDown: [String] )  {
        
        dropDown.anchorView = viewDropDown
        dropDown.dataSource = listDropDown
        dropDown.bottomOffset = CGPoint(x: 0, y: (dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.topOffset = CGPoint(x: 0, y: -(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.selectionAction =
//
//            {  (index: Int, item: String) in
//                textDropDown.text = listDropDown[index]
//                print(listDropDown[index])
//           }
            
            {
            [unowned self] (index: Int, item: String) in textDropDown.text = listDropDown[index]
        }
       
    }
}
