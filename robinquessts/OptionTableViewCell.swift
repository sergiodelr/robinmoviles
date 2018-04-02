//
//  OptionTableViewCell.swift
//  robinquessts
//
//  Created by Sergio De Leon on 13/03/18.
//  Copyright © 2018 Sergio De Leon. All rights reserved.
//

import UIKit

protocol OptionSelect: class {
    func selectOption(_ sender: OptionTableViewCell)
}

class OptionTableViewCell: UITableViewCell {

    @IBOutlet weak var robinsLabel : UILabel!
    @IBOutlet weak var optionButton : UIButton!
    weak var delegate:OptionSelect?
    var questAction : QuestAction!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    @IBAction func selectedOption(_ sender: UIButton) {
        delegate?.selectOption(self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
