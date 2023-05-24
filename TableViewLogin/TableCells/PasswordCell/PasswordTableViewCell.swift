//
//  PasswordTableViewCell.swift
//  TableViewLogin
//
//  Created by Anmol Varshney on 08/05/23.
//

import UIKit

class PasswordTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "PasswordTableViewCell"
    var closure: ((String)->())? = nil

    @IBOutlet weak var passwordTextField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        passwordTextField.isSecureTextEntry = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func passwordTxtChanged(_ sender: UITextField) {
        if let username = passwordTextField.text, let closure = closure {
            closure(username)
        }
    }
}
