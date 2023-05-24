//
//  MainScreenViewController.swift
//  TableViewLogin
//
//  Created by Anmol Varshney on 08/05/23.
//

import UIKit

class MainScreenViewController: UIViewController  {
    
    
    let pattern = ["[A-Z]\\w+","[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}","^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$","^[0-9]{6}$"]
    var checked = [0,0,0,0,0,0]
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.register(UINib(nibName: UsernameTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: UsernameTableViewCell.reuseIdentifier)
            
            tableView.register(UINib(nibName: EmailTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: EmailTableViewCell.reuseIdentifier)
            
            tableView.register(UINib(nibName: PasswordTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: PasswordTableViewCell.reuseIdentifier)
            
            tableView.register(UINib(nibName: DobTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: DobTableViewCell.reuseIdentifier)
            
            tableView.register(UINib(nibName: PincodeTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: PincodeTableViewCell.reuseIdentifier)
            
            tableView.register(UINib(nibName: AddressTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: AddressTableViewCell.reuseIdentifier)
            
            tableView.register(UINib(nibName: ButtonTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: ButtonTableViewCell.reuseIdentifier)
            
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    var username = ""
    var email = ""
    var password = ""
    var dob = ""
    var pincode = ""
    var address = ""
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    func showError(alertMessage: String, alertTitle: String){
        let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    func dateValidator(userDate: Date){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: userDate)

        let calendar = Calendar.current
        let currentDate = Date()
        let selectedDate = userDate
        let difference = calendar.dateComponents([.year], from: selectedDate, to: currentDate).year ?? 0
        
        if(difference <= 10){
            checked[4] = 1
            dob = dateString
            
        }
        else{
            checked[4] = 0
        }
    }
    func validateInputs(mainString: String, sender: Int, message: String, aTitle: String) -> Bool{
        if let range = mainString.range(of: pattern[sender], options: .regularExpression) {
            _ = String(mainString[range])
            checked[sender] = 1
            return true
        } else {
            showError(alertMessage: message,alertTitle: aTitle )
            return false
        }
    }
    
    
}
extension MainScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // Set the background color of the cell to a transparent color
        cell.backgroundColor = UIColor.clear
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.row{
        case 0 : return usernameCell(indexPath)
        case 1: return emailCell(indexPath)
        case 2: return passwordCell(indexPath)
        case 3: return dobCell(indexPath)
        case 4: return pincodeCell(indexPath)
        case 5: return addressCell(indexPath)
        case 6: return buttonCell(indexPath)
        default:return UITableViewCell()
        }
    }
    
    func usernameCell(_ indexPath: IndexPath) -> UITableViewCell{
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UsernameTableViewCell.reuseIdentifier) as? UsernameTableViewCell else{
            return UITableViewCell()
        }
        cell.closure = { (value) in
            if value != ""{
                if self.validateInputs(mainString: value, sender: 0, message: "Please don't include number or any special character in Username", aTitle: "Username"){
                    self.username = value
                }
            }
        }
        return cell
    }
    
    func emailCell(_ indexPath: IndexPath) -> UITableViewCell{
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EmailTableViewCell.reuseIdentifier) as? EmailTableViewCell else{
            return UITableViewCell()
        }
        cell.closure = { (value) in
            if value != ""{
                if self.validateInputs(mainString: value, sender: 1, message: "Please enter the proper email", aTitle: "Email"){
                    self.email = value
                }
            }
        }
        return cell
    }
    
    func passwordCell(_ indexPath: IndexPath) -> UITableViewCell{
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PasswordTableViewCell.reuseIdentifier) as? PasswordTableViewCell else{
            return UITableViewCell()
        }
        cell.closure = { (value) in
            if value != ""{
                if self.validateInputs(mainString: value, sender: 2, message: "Please enter the proper password - \n\n At least 8 characters \n Contain atleast one lowercase \n Contain atleast one uppercase \n Contain atleast one digit \n Contains atleat one special character", aTitle: "Password"){
                    self.password = value
                }
            }
        }
        return cell
    }
    func dobCell(_ indexPath: IndexPath) -> UITableViewCell{
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DobTableViewCell.reuseIdentifier) as? DobTableViewCell else{
            return UITableViewCell()
        }
        cell.closure = { (value) in
            self.dateValidator(userDate: value)
        }
        return cell
    }
    func pincodeCell(_ indexPath: IndexPath) -> UITableViewCell{
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PincodeTableViewCell.reuseIdentifier) as? PincodeTableViewCell else{
            return UITableViewCell()
        }
        cell.closure = { (value) in
            if value != ""{
                if self.validateInputs(mainString: value, sender: 3, message: "Please enter the six digit pincode", aTitle: "Pincode"){
                    self.pincode = value
                }
            }
        }
        return cell
    }
    func addressCell(_ indexPath: IndexPath) -> UITableViewCell{
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AddressTableViewCell.reuseIdentifier) as? AddressTableViewCell else{
            return UITableViewCell()
        }
        cell.closure = { (value) in
            if value == ""{
                self.checked[5] = 0
                self.address = value
                self.showError(alertMessage: "Please enter the address", alertTitle: "Address")
            }
            else{
                self.checked[5] = 1
            }
        }
        return cell
    }
    func buttonCell(_ indexPath: IndexPath) -> UITableViewCell{
        var p = 0
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ButtonTableViewCell.reuseIdentifier) as? ButtonTableViewCell else{
            return UITableViewCell()
        }
        cell.closure = { () in
            print(self.checked)
            for i in 0..<self.checked.count{
                if self.checked[i] == 0{
                    self.showError(alertMessage: "Please enter the proper field", alertTitle: "Submit")
                    p=1
                    break
                }
            }
            if(p==0){
                let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                let userEntity = UserEntity(context: context)
                userEntity.username = self.username
                userEntity.email = self.email
                userEntity.password = self.password
                userEntity.dob = self.dob
                userEntity.pincode = self.pincode
                userEntity.address = self.address
                do{
                    //to save in DB
                    try context.save()
                    
                    

                }
                catch{
                    print("Error",error)
                }
                SignInViewController.instance(nav: self.navigationController!)
                
            }
        }
        return cell
    }
    
}


