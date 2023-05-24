//
//  ButtonTableViewCell.swift
//  TableViewLogin
//
//  Created by Anmol Varshney on 08/05/23.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "ButtonTableViewCell"

    var closure: (()->())?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func submitBtnClicked(_ sender: UIButton) {
        closure?()
    }
}
