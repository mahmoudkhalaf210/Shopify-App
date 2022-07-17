//
//  AddNewAddressViewController.swift
//  Shopify
//
//  Created by Macintosh on 15/07/2022.
//

import UIKit

class AddNewAddressViewController: UIViewController {
    
    
    @IBOutlet weak var addAddressBtn: UIButton!
    @IBOutlet weak var phoneTxtLbl: UITextField!
    @IBOutlet weak var addressTxtLbl: UITextField!
    @IBOutlet weak var cityTxtLbl: UITextField!
    @IBOutlet weak var countryTxtLbl: UITextField!
    
    
    var customerID : Int = 0
    
    let networking = NetworkManger()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func custmoizeBtn()
    {
        addAddressBtn.backgroundColor = .clear
        addAddressBtn.layer.cornerRadius = 5
        addAddressBtn.layer.borderWidth = 1
        addAddressBtn.layer.borderColor = UIColor.tintColor.cgColor
    }


    @IBAction func addAddressBtn(_ sender: Any) {
        
        
        checkData()
        
        if addressTxtLbl.text != "" && cityTxtLbl.text != "" && countryTxtLbl.text != "" && phoneTxtLbl.text != ""
        {
            guard let customerID = Helper.shared.getUserID(), let name = Helper.shared.getUserName(), let address = addressTxtLbl.text, !address.isEmpty, let country = countryTxtLbl.text, !country.isEmpty, let city = cityTxtLbl.text, !city.isEmpty, let phone = phoneTxtLbl.text, !phone.isEmpty, phone.count == 11 else {
                showAlertError(title: "Missing Data", message: "Please fill your info")
                return
            }
            
            let add = Address(address1: address, city: city, province: "", phone: phone, zip: "", last_name: "", first_name: name, country: "Egypt", id: nil)
            
            networking.createAddress(customerId: customerID, address: add) { data , res, error in
                if error == nil{
                    print("success to create address")
                    Helper.shared.setFoundAdress(isFoundAddress: true)
                    DispatchQueue.main.async {
                        self.navigationController?.popViewController(animated: true)
                    }
                }else{
                    print("falied to create address")
                }
            }
        }
    }
    func checkData() {
        let titleMessage = "Missing Data"
        if countryTxtLbl.text == "" {
            showAlertError(title: titleMessage, message: "Please enter your country name")
        }
            
        if cityTxtLbl.text == "" {
            showAlertError(title: titleMessage, message: "Please enter your city name")
        }
            
        if addressTxtLbl.text == "" {
            showAlertError(title: titleMessage, message: "Please enter your address")
        }
            
        if phoneTxtLbl.text == "" {
            showAlertError(title: titleMessage, message: "Please enter you phone number")
                
        } else {
            let check: Bool = validate(value: phoneTxtLbl.text!)
            if check == false {
                self.showAlertError(title: "invalid data!", message: "please enter you phone number in correct format")
            }
        }
    }

    func validate(value: String) -> Bool {
        let PHONE_REGEX = "^\\d{11}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result = phoneTest.evaluate(with: value)
        print("RESULT \(result)")
        return result
    }
}
