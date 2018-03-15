//
//  ViewController.swift
//  robinquessts
//
//  Created by Sergio De Leon on 13/03/18.
//  Copyright © 2018 Sergio De Leon. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var questID = "qst-1"
    var newQuestID : String?
    var questActions = [QuestAction]()
    var desc : String?
    var robins : Int?
    var userID = "LBOA6sbjbuXRnE1yMLrozeFeoH92"
    var FireBase_REF : DatabaseReference!
    
    var semaphore = DispatchSemaphore(value: 0)
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FireBase_REF = Database.database().reference()
        print("loadviews")
        // Do any additional setup after loading the view, typically from a nib.
        FireBase_REF.child("children").child(userID).observe(.value, with: { snapshot in
            if let value = snapshot.value as? NSDictionary{
                self.questID = (value["quest"] as? String)!
                self.robins = value["robins"] as? Int
            }
            self.semaphore.signal()
        })
        
        semaphore.wait()
        loadQuest()
        print("viewdidload")
    }

    func loadQuest() {
        FireBase_REF.child("quests").child(questID).observe(.value, with: { snapshot in
            if let value = snapshot.value as? NSDictionary{
                self.desc = value["description"] as? String
                self.robins = value["robins"] as? Int
                var action = QuestAction(snapshot: snapshot.childSnapshot(forPath: "option-1"))
                self.questActions.append(action)
                action = QuestAction(snapshot: snapshot.childSnapshot(forPath: "option-2"))
                self.questActions.append(action)
                self.tableView.reloadData()
            }
            self.semaphore.signal()
        })
        
        semaphore.wait()
        
        descriptionLabel.text = desc!
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questActions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "optionCell") as! OptionTableViewCell
        let questAction = questActions[indexPath.row]
        
        cell.optionButton.titleLabel?.text = questAction.optionDesc
        cell.robinsLabel.text = "$\(String(describing: questAction.robins))"
        cell.questAction = questAction
        
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

