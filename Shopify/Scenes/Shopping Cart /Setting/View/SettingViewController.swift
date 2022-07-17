//
//  SettingViewController.swift
//  Shopify
//
//  Created by Macintosh on 15/07/2022.
//

import UIKit

class SettingViewController: UIViewController {
    var customerId : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: -  func logout
    @IBAction func LogOut(_ sender: Any) {
        showAlert(title: "Do you want to log out?", message: "if you pressed log ") { succes in
                   if succes {
                       Helper.shared.setUserStatus(userIsLogged: false)
                       Helper.shared.setFoundAdress(isFoundAddress: false)
                       self.performSegue(withIdentifier: "gotohome", sender: self)
                   }
               }
           
    }
    // MARK: -  func go to address btn
    @IBAction func goToAddressBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "addressme") as! addressInMeViewController
       print(customerId)
        vc.customerID = customerId
         navigationController?.pushViewController(vc, animated: true)
    }
}
extension SettingViewController {
    
    // MARK: -  func show alert

func showAlert(title:String, message:String,complition:@escaping (Bool)->Void){
    let actionSheet = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
    let logOut = UIAlertAction(title: "Log out", style: .destructive) { _ in
        complition(true)
    }
    let cancel = UIAlertAction(title: "Cancel", style: .default) { _ in
        complition(false)
    }
    actionSheet.addAction(logOut)
    actionSheet.addAction(cancel)
    self.present(actionSheet, animated: true, completion: nil)
}
}
