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
    
    @IBAction func LogOut(_ sender: Any) {
        showAlertSheet(title: "Do you want to log out?", message: "if you pressed log out, we will miss you 💔") { succes in
                   if succes {
                       Helper.shared.setUserStatus(userIsLogged: false)
                       Helper.shared.setFoundAdress(isFoundAddress: false)
                       let vc = self.storyboard?.instantiateViewController(withIdentifier: "TabBarHome") as! UITabBarController
                       self.dismiss(animated: true)
                       self.navigationController?.pushViewController(vc, animated: true)
                       
                   }
               }
           
    }
    
 
    @IBAction func goToAddressBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "addressme") as! addressInMeViewController
       print(customerId)
        vc.customerID = customerId
        
         navigationController?.pushViewController(vc, animated: true)
    }
    
}
