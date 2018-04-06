//
//  PerksTableViewCell.swift
//  robinquessts
//
//  Created by Lorraine Bichara Assad on 3/14/18.
//  Copyright © 2018 Sergio De Leon. All rights reserved.
//

import UIKit

class PerksTableViewCell: UITableViewCell {

   
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    var perkAction : PerkAction!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
