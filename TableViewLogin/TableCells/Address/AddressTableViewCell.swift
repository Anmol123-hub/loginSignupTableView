//
//  AddressTableViewCell.swift
//  TableViewLogin
//
//  Created by Anmol Varshney on 08/05/23.
//

import UIKit

class AddressTableViewCell: UITableViewCell, UITextViewDelegate {
    
    static let reuseIdentifier = "AddressTableViewCell"
    
    var closure: ((String) -> ())? = nil

    @IBOutlet weak var addressTextView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addressTextView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func textViewDidChange(_ textView: UITextView) {
            if let text = textView.text, let closure = closure {
                closure(text)
            }
        }
    
}
