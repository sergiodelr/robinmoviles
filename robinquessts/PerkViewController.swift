//
//  PerkViewController.swift
//  robinquessts
//
//  Created by Lorraine Bichara Assad on 3/14/18.
//  Copyright © 2018 Sergio De Leon. All rights reserved.
//

import UIKit

class PerkViewController: UIViewController {
    var perk = PerkAction()

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var descript: UILabel!
    @IBOutlet weak var price: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Perk Detail"
        name.text = perk.name
        descript.text = perk.desc

        let perkPrice = perk.price as NSNumber
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        price.text = formatter.string(from: perkPrice)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func btBuy(_ sender: UIButton) {
        //Agregarlo al myperks del niño
        
        //para regresar a la pantalla de perks
        navigationController?.popViewController(animated: true)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
