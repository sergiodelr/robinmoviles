//
//  PerkAction.swift
//  robinquessts
//
//  Created by Lorraine Bichara Assad on 4/6/18.
//  Copyright © 2018 Sergio De Leon. All rights reserved.
//

import UIKit
import Firebase

class PerkAction: NSObject {
    var perkID: String!
    var desc: String!
    var price: Int!
    var name: String!
    
    var optionDesc: String!
    var robins: Int!
    var questID: String!
    
    init(snapshot: DataSnapshot) {
        let value = snapshot.value as? NSDictionary
        perkID = value?["perk-id"] as? String
        desc = value?["descripcion"] as? String
        name = value?["name"] as? String
        price = value?["precio"] as? Int
    }

}
