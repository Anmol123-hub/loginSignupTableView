//
//  EmailTableViewCell.swift
//  TableViewLogin
//
//  Created by Anmol Varshney on 08/05/23.
//

import UIKit

class EmailTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "EmailTableViewCell"
    var closure: ((String)->())? = nil

    @IBOutlet weak var emailTextField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func emailTxtChanged(_ sender: UITextField) {
        if let username = emailTextField.text, let closure = closure {
            closure(username)
        }
    }
    
}
