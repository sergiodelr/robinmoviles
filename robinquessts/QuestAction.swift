//
//  QuestAction.swift
//  robinquessts
//
//  Created by Sergio De Leon on 13/03/18.
//  Copyright © 2018 Sergio De Leon. All rights reserved.
//

import UIKit
import Firebase

class QuestAction: NSObject {

    var optionDesc: String!
    var robins: Int!
    var questID: String!
    
    init(snapshot: DataSnapshot) {
        let value = snapshot.value as? NSDictionary
        robins = value?["amount"] as? Int
        optionDesc = value?["description"] as? String
        questID = value?["quest-id"] as? String
    }
    
}
