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

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, OptionSelect {
    

    var questID = "qst-1"
    var newQuestID : String?
    var questActions = [QuestAction]()
    var desc : String!
    var robins : Int?
    var userID = "imFloJbncJMTOG95pLNGtb7jzGp1"
    var FireBase_REF : DatabaseReference!
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        FireBase_REF = Database.database().reference()
        print(FireBase_REF)
        Auth.auth().signIn(withEmail: "s@gmail.com", password: "sergio1"){ (user,error) in
            
            
            self.FireBase_REF.child("children").child(self.userID).observe(.value, with: { snapshot in
                if let value = snapshot.value as? NSDictionary{
                    print(value)
                    self.questID = (value["quest"] as? String)!
                    self.robins = value["robins"] as? Int
                }
            }) { error in
                print(error.localizedDescription)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        desc = "descripcion"
       
        loadQuest()
    }

    func loadQuest() {
        FireBase_REF = Database.database().reference()
        FireBase_REF.child("quests").child(questID).observe(.value, with: { snapshot in
            if let value = snapshot.value as? NSDictionary {
                print(value)
                self.desc = value["description"] as? String
                self.descriptionLabel.text = self.desc
                self.questActions.removeAll()
                var action = QuestAction(snapshot: snapshot.childSnapshot(forPath: "option-1"))
                self.questActions.append(action)
                action = QuestAction(snapshot: snapshot.childSnapshot(forPath: "option-2"))
                self.questActions.append(action)
                self.tableView.reloadData()
            }
        })
        
    }
    
    func selectOption(_ sender: OptionTableViewCell) {
        questID = sender.questAction.questID
        robins = robins! + sender.questAction.robins
        loadQuest()
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
        
        print(questAction.optionDesc)
        cell.optionButton.setTitle(questAction.optionDesc, for: .normal)
        cell.robinsLabel.text = "$\(String(describing: questAction.robins!))"
        cell.questAction = questAction
        cell.delegate = self
        
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

