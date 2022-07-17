//
//  SignUpViewModel.swift
//  Shopify
//
//  Created by Mostafa Elbadawy on 13/07/2022.
//

import Foundation

class SignUpViewModel {
    var end : String
    var customer: Customer? {
        didSet {
            bindingData(customer,nil)
        }
    }
    var error: Error? {
        didSet {
            bindingData(nil, error)
        }
    }
    
    let apiService : ApiService
    var bindingData: ((Customer?,Error?) -> Void) = {_, _ in }
    init(apiService: ApiService = NetworkManger() , endpoint : String) {
        self.apiService = apiService
        self.end = endpoint
    }
    func createNewCustomer(newCustomer: NewCustomer, completion:@escaping (Data?, URLResponse? , Error?)->()){
        apiService.register(endPoint: end,newCustomer: newCustomer) { data, response, error in
            if error == nil {
                guard let data = data else {return}
                let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Dictionary<String,Any>
                let customer = json["customer"] as? Dictionary<String,Any>
                print(customer)
                completion(data, response, nil)
            }else{
                completion(nil, nil, error)
            }
        }
    }
    func emailIsValid(_ email: String) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if emailPred.evaluate(with: email){
            return true
        }else{
            return false
        }
    }
    func passwordIsValied(password: String, confirmPassword: String) -> Bool{
        if !password.isEmpty && password.count >= 6 && !confirmPassword.isEmpty && confirmPassword.count >= 6 && password == confirmPassword{
            return true
        }else {
            return false
        }
    }
}
