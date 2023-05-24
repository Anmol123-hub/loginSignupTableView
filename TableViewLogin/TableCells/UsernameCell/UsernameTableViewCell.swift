//
//  UsernameTableViewCell.swift
//  TableViewLogin
//
//  Created by Anmol Varshney on 08/05/23.
//

import UIKit

class UsernameTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "UsernameTableViewCell"
    
    var closure: ((String)->())? = nil
    
    @IBOutlet weak var usernameTextFiled: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func usernameTxtChanged(_ sender: UITextField) {
        if let username = usernameTextFiled.text, let closure = closure {
            closure(username)
        }
    }
    
}
