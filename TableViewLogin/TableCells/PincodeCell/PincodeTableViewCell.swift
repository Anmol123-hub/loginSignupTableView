//
//  PincodeTableViewCell.swift
//  TableViewLogin
//
//  Created by Anmol Varshney on 08/05/23.
//

import UIKit

class PincodeTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "PincodeTableViewCell"
    
    var closure: ((String)->())? = nil

    @IBOutlet weak var pincodeTextField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func pincodeChanged(_ sender: UITextField) {
        if let pincode = pincodeTextField.text, let closure = closure{
            closure(pincode)
        }
    }
}
