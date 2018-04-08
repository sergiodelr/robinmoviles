//
//  Perk.swift
//  robinquessts
//
//  Created by Lorraine Bichara Assad on 4/7/18.
//  Copyright © 2018 Sergio De Leon. All rights reserved.
//

import UIKit

class Perk: NSObject {
    var name : String
    var descript : String
    var price : Float
    
    override init() {
        name = ""
        descript = ""
        price = 0
    }
    
    init(name: String, descript: String, price: Float) {
        self.name = name
        self.descript = descript
        self.price = price
    }

}
