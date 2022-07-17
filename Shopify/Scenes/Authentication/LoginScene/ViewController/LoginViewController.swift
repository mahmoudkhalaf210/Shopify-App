//
//  LoginViewController.swift
//  BasicStructure
//
//  Created by n0shy on 14/07/2022.
//

import UIKit


class LoginViewController: UIViewController {
    
    
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
   // @IBOutlet weak var emailContainerView: UIView!
   // @IBOutlet weak var passwordContainerView: UIView!
    
    var networkIndicator = UIActivityIndicatorView()
    var customes = [Customer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        getCustomers()
    }
 
    
    
    func showAlert(message : String){

            let alert = UIAlertController(title: "Some thing wronge", message: message , preferredStyle: .actionSheet)

            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

            self.present(alert, animated: true, completion: nil)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        getCustomers()
        for i in customes {
            print(i.first_name)
        }
    }
    
    @IBAction func loginAction(_ sender: Any) {
        print("login")
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            showAlert(message: "Complete all data first .")
            return
        }
        if let customer = customes.first(where: {$0.email == email && $0.tags == password}) {

           // Helper.shared.checkUserIsLogged(completion: true)
            Helper.shared.setUserStatus(userIsLogged: true)
            Helper.shared.setUserID(customerID: customer.id)
            Helper.shared.setUserEmail(userEmail: customer.email)
            Helper.shared.setUserName(userName: customer.first_name)
            let allAddresses = customer.addresses
            let addresses = allAddresses?.isEmpty
          
            if addresses! {
                Helper.shared.setFoundAdress(isFoundAddress: false)
                
            }
            else {
                Helper.shared.setFoundAdress(isFoundAddress: true)
            }
            
            
            
            print("loged in success")
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "TabBarHome") as! UITabBarController
        //    self.navigationController?.popViewController(animated: true)
            self.navigationController?.pushViewController(vc, animated: true)

        }else{
            showAlert(message: "No customer with this data .")
        }
        
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TabBarHome") as! UITabBarController
      //  self.navigationController?.popViewController(animated: true)
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    @IBAction func forgetPasswordAction(_ sender: Any) {
    }
    @IBAction func signUpAction(_ sender: Any) {
        
        let signupViewController = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        signupViewController.customes = customes
        self.navigationController?.pushViewController(signupViewController, animated: true)
    }
}

extension LoginViewController {
    func getCustomers(){
        let loginViewModel = LoginViewModel(endpoint: "customers.json")
        loginViewModel.fetchData()
        loginViewModel.bindingData = { [weak self] customers , error in
            guard let self = self else {return}
            if let customers = customers {
                DispatchQueue.main.async {
                    self.networkIndicator.stopAnimating()
                    self.customes = customers
                }
            }
            if let error = error {
                print(error.localizedDescription)
            }
            
        }
    }
}
  
