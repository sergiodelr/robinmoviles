//
//  TableViewController.swift
//  robinquessts
//
//  Created by Lorraine Bichara Assad on 3/14/18.
//  Copyright © 2018 Sergio De Leon. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class TableViewController: UITableViewController {
    
    var perkActions = [PerkAction]()
    let ref = Database.database().reference().child("Perks")
    
//    var perkList = [Perk]()
//    var perkActions = [PerkAction]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
//        let perk1 = Perk(name: "Interest Rate", descript: "The kid will be able to ....Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce at ultrices massa. Nam bibendum quam a neque maximus, quis pretium neque maximus. Nullam dictum vitae felis fringilla maximus.", price: 30)
//        let perk2 = Perk(name: "Increase Purchase Limit", descript: "Vestibulum vitae accumsan sapien, a molestie nibh. Aenean nisl enim, fringilla ut sapien sit amet, lacinia lacinia erat. Etiam finibus eros quis elementum consequat.", price: 45)
//
//        perkList += [perk1, perk2]
        
        retrievePerks()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.perkActions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PerksTableViewCell
        
        var perk = PerkAction()
        perk = perkActions[indexPath.row]
        cell.title.text = perk.name
        cell.price.text = perk.price
        
        return cell
//        let perkAction = perkActions[indexPath.row] //índice no es válido
//        print(perkAction.desc)
//        cell.title.text = "$\(String(describing: perkAction.name!))"
//        cell.price.text = "$\(String(describing: perkAction.price!))"
//        cell.perkAction = perkAction
//
//        return cell
        
        //        cell.title.text = perkList[indexPath.row].name
        //
        //        let price = perkList[indexPath.row].price as NSNumber
        //        let formatter = NumberFormatter()
        //        formatter.numberStyle = .currency
        //        cell.price.text = formatter.string(from: price)
        //
        //        return cell
    }
    
    func retrievePerks() {
        ref.queryOrdered(byChild: "perk-id").observeEventType(.ChildAdded, withBlock: {
            (snapshot) in
            
            if let dictionary = snapshot.value as? [String:AnyObject] {
                let perk = PerkAction(snapshot: <#DataSnapshot#>)
                
                perk.setValuesForKeysWithDictionary(dictionary)
                
                self.perkActions.append(perk)
                dispatch_async(dispatch_get_main_queue(), {
                    self.tableView.reloadData()
                })
            }
        })
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let perkView = segue.destination as! PerkViewController
        let index = tableView.indexPathForSelectedRow!
        perkView.perk = perkActions[index.row]
    }
}
