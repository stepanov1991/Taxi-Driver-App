//
//  Singelton.swift
//  Taxi Driver App
//
//  Created by user on 01.06.2021.
//

import Foundation

class Singelton {
    static let shared = Singelton()
    
    private init() {}
    
    var service = ""
}
