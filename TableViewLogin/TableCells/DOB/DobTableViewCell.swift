//
//  DobTableViewCell.swift
//  TableViewLogin
//
//  Created by Anmol Varshney on 08/05/23.
//

import UIKit

class DobTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "DobTableViewCell"
    var closure: ((Date)->())? = nil
    
    @IBOutlet weak var datePicker: UIDatePicker!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let calendar = Calendar.current
        let currentDate = Date()
        let minDate = calendar.date(byAdding: .year, value: -10, to: currentDate)
        datePicker.maximumDate = minDate
        
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        let selectedDate = datePicker.date
        closure?(selectedDate)
    }
}
