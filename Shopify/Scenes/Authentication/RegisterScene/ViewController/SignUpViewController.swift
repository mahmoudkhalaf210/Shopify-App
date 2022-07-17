//
//  SignUpViewController.swift
//  BasicStructure
//
//  Created by n0shy on 14/07/2022.
//

import UIKit

class SignUpViewController: UIViewController {
    
   
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    var networkIndicator = UIActivityIndicatorView()
    var customes = [Customer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
  
    @IBAction func signUpAction(_ sender: Any) {
        guard let firstName = firstNameTextField.text, let lastName = lastNameTextField.text, let email = emailTextField.text, let password = passwordTextField.text, let confirmPassword = confirmPasswordTextField.text else { return }
        print("PRESSED")
        register()
    }
    
    
    
    func register(){
        guard let firstName = firstNameTextField.text, let lastName = lastNameTextField.text, let email = emailTextField.text,
              let password = passwordTextField.text else {return}
        let customer = Customer(first_name: firstName, last_name: lastName, email: email, phone: nil, tags: password, id: nil, verified_email: true, addresses: nil)
        let newCustomer = NewCustomer(customer: customer)
       
        if checkUserIsExist(email: email) {
            //user found
        }else{
            let signUpViewModel = SignUpViewModel(endpoint: "customers.json")
            signUpViewModel.createNewCustomer(newCustomer: newCustomer) { data, response, error in
                
                guard error == nil else {
                    //register is not success
                    print("error")
                    return
                }
                
                
                guard let data = data else {
                    return
                }
                
                print(data)
                
            }
                print("register is success")
            }
        DispatchQueue.main.async {
            
            UIApplication.shared.keyWindow?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "home")
        }
        }
    }


extension SignUpViewController {
    func checkUserIsExist(email: String) -> Bool {
        guard let customer = customes.first(where: {$0.email ==  email}) else { return false}
        return true
    }
}
