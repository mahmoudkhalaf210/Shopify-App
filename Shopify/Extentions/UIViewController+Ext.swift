//
//  UIViewController+Extention.swift
//  Shopify
//
//  Created by Mostafa Elbadawy on 13/07/2022.
//

import UIKit

extension UIViewController{
    func showAlertError(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .destructive, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}

extension UIViewController{
    func showConfirmAlert(title:String, message:String, complition:@escaping (Bool)->Void){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelBtn = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let confirmBtn = UIAlertAction(title: "Confirm", style: .destructive) { _ in
            complition(true)
        }
        alert.addAction(cancelBtn)
        alert.addAction(confirmBtn)
        self.present(alert, animated: true, completion: nil)
    }
}

extension UIViewController{
    func showAlertForInterNetConnection(){
        let alert = UIAlertController(title: "network is not connected", message: "please, check your internet connection for using app..", preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okBtn)
        self.present(alert, animated: true, completion: nil)
    }
}




extension UIViewController{
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}

