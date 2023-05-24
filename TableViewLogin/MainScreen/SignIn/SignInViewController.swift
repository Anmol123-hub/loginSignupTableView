//
//  SignInViewController.swift
//  TableViewLogin
//
//  Created by Anmol Varshney on 09/05/23.
//

import UIKit

class SignInViewController: UIViewController {
    
    //MARK: Outlet
    @IBOutlet weak var tableViewLogin: UITableView!{
        didSet{
            tableViewLogin.register(UINib(nibName: EmailTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: EmailTableViewCell.reuseIdentifier)
            
            tableViewLogin.register(UINib(nibName: PasswordTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: PasswordTableViewCell.reuseIdentifier)
            
            tableViewLogin.register(UINib(nibName: ButtonTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: ButtonTableViewCell.reuseIdentifier)
            
            tableViewLogin.dataSource = self
            tableViewLogin.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do{
            users = try context.fetch(UserEntity.fetchRequest())
        }
        catch{
            print("Error while fetching",error)
        }
        // Do any additional setup after loading the view.
    }
    
    //MARK: Variable Declaration
    var email = ""
    var password = ""
    var users: [UserEntity] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    class func instance(nav: UINavigationController){
        let vc  = SignInViewController()
        nav.pushViewController(vc, animated: true)
    }
    
    //MARK: Functions
    func showError(alertMessage: String, alertTitle: String){
        let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}
extension SignInViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // Set the background color of the cell to a transparent color
        cell.backgroundColor = UIColor.clear
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.row{
        case 0: return emailCell(indexPath)
        case 1: return passwordCell(indexPath)
        case 2: return buttonCell(indexPath)
        default:return UITableViewCell()
        }
        
        //        return cell
    }
    
    
    func emailCell(_ indexPath: IndexPath) -> UITableViewCell{
        guard let cell = tableViewLogin.dequeueReusableCell(withIdentifier: EmailTableViewCell.reuseIdentifier) as? EmailTableViewCell else{
            return UITableViewCell()
        }
        cell.closure = { (value) in
            if value != ""{
                self.email = value
            }
            
        }
        return cell
    }
    
    func passwordCell(_ indexPath: IndexPath) -> UITableViewCell{
        guard let cell = tableViewLogin.dequeueReusableCell(withIdentifier: PasswordTableViewCell.reuseIdentifier) as? PasswordTableViewCell else{
            return UITableViewCell()
        }
        cell.closure = { (value) in
            if value != ""{
                self.password = value
            }
            
        }
        return cell
    }
    
    func buttonCell(_ indexPath: IndexPath) -> UITableViewCell{
        
        guard let cell = tableViewLogin.dequeueReusableCell(withIdentifier: ButtonTableViewCell.reuseIdentifier) as? ButtonTableViewCell else{
            return UITableViewCell()
        }
        cell.closure = { () in
            
            var counter = 0
            for i in 0..<self.users.count{
                if self.users[i].email == self.email && self.users[i].password == self.password{
                    counter = 1
                    break
                }
            }
            if(counter == 1){
                self.showError(alertMessage: "Successfully loged In", alertTitle: "Success")
            }
            else{
                self.showError(alertMessage: "Email or password don't matched", alertTitle: "Alert!")
            }
        }
        return cell
    }
    
}
