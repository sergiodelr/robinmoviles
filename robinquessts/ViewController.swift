//
//  ViewController.swift
//  robinquessts
//
//  Created by Sergio De Leon on 13/03/18.
//  Copyright © 2018 Sergio De Leon. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {

    var questID : String?
    var newQuestID : String?
    var questActions = [QuestAction]()
    var desc : String?
    var robins : Int?
    var userID = "LBOA6sbjbuXRnE1yMLrozeFeoH92"
    var FireBase_REF = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        FireBase_REF.child("children").child(userID).observe(.value, with: { snapshot in
            if let value = snapshot.value as? NSDictionary{
                self.questID = value["quest"] as? String
                self.robins = value["robins"] as? Int
            }
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

