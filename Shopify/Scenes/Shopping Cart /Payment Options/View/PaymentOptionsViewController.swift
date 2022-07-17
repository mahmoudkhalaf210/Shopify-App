//
//  PaymentOptionsViewController.swift
//  Shopify
//
//  Created by Macintosh on 05/07/2022.
//

import UIKit
import PassKit

class PaymentOptionsViewController: UIViewController {
    
    
    @IBOutlet weak var countinueLBLbtn: UIButton!
    let options : [String] = ["Pay Online" , "Cash On Delivery (COD)"]
    
    var TotalCart  = [CartItem]()
    var totalCost : Double = 0.0
    var customerID : Int64 = 0
    var address : String = ""
    var typeOfPay : String = ""
    
    var cartDelete = [CartItem]()
    var counterNumOfOrders = [CounterOfOrder]()
    var counters = [Int64]()
    var counterNumOfOrder = Int64()
    
    var db = DBmanger.sharedInstance
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       cartDelete =  db.fetchDataCart(appDelegate: appDelegate)
        
        
        print(address)
        print(customerID)
        print(totalCost)
        for item in TotalCart {
            print(item)
        }

        
        // payment online
        
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
       // db.IncreaseCounter(appDelegate: appDelegate, counter: 0)
        
        counterNumOfOrders = db.fetchDataOfCounter(appDelegate: appDelegate)
      
       /* for c in counterNumOfOrders {
            db.deleteCounter(numb: c, appDelegate: appDelegate)
        }
         */
        
        
        
        for item in counterNumOfOrders {
            counters.append(item.numoforder)
        }
        
        
        if counters.count > 0 {
            counterNumOfOrder =  counters.last! + 1
        } else {
            counterNumOfOrder = 1
        }
    }
    
    //MARK: - Make request of online payment

    func makeRequest () -> PKPaymentRequest {
        let request = PKPaymentRequest()
         request.merchantIdentifier = "merchant."
         request.supportedNetworks = [.quicPay, .masterCard, .visa]
         request.supportedCountries = ["IN","US"]
         request.merchantCapabilities = .capability3DS
         request.countryCode = "IN"
         request.currencyCode = "INR"
         request.paymentSummaryItems = [PKPaymentSummaryItem(label: "Apple",  amount: NSDecimalNumber(string: "\(totalCost)"), type: .final)]
         return request
    }

    // MARK: - Continue to Paymnet
    
    @IBAction func ContinueToFinishOrder(_ sender: Any) {
        let alert = UIAlertController(title: "Order", message: "Are you want to add order ?", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Ok", style: .default) { [self] (action) in
            if self.typeOfPay == "Pay Online" {
                self.counterNumOfOrder += 1
                db.addOrders(appDelegate: self.appDelegate, customerid: customerID, total: totalCost, time: Date(), number: counterNumOfOrder)
                for item in TotalCart {
                    db.addOrderItem(appDelegate: appDelegate, customerId: customerID , price: item.price, title: item.productTitle!, typeOfPay: typeOfPay, total: totalCost, numofitem: item.numOfItem, time: Date() , address: address , number: counterNumOfOrder , imageitem: item.productImg!)
                }
                
                for item in cartDelete {
                    db.delete(leagueItem: item, appDelegate: appDelegate)
                }
                
                db.IncreaseCounter(appDelegate: appDelegate, counter: counterNumOfOrder)
                performSegue(withIdentifier: "go", sender: self)
            
            }
            else if typeOfPay == "Pay Cash" {
                
                counterNumOfOrder += 1
                
                db.addOrders(appDelegate: appDelegate, customerid: customerID, total: totalCost, time: Date(), number: counterNumOfOrder)
                
                for item in TotalCart {
                    db.addOrderItem(appDelegate: appDelegate, customerId: customerID , price: item.price, title: item.productTitle!, typeOfPay: typeOfPay, total: totalCost, numofitem: item.numOfItem, time: Date() , address: address , number: counterNumOfOrder , imageitem: item.productImg!)
                }
              
                for item in cartDelete {
                    db.delete(leagueItem: item, appDelegate: appDelegate)
                }
                
                db.IncreaseCounter(appDelegate: appDelegate, counter: counterNumOfOrder)
         
                performSegue(withIdentifier: "go", sender: self)

                
            }else {
                print("choose payment type ")
            }
    
        }
        let action2 = UIAlertAction(title: "cancel", style: .cancel)
        alert.addAction(action1)
        alert.addAction(action2)
        self.present(alert, animated: true , completion: nil)
    }
    
    
    // MARK: - Func make online
    @objc func tapForPay(){
        let controller = PKPaymentAuthorizationViewController(paymentRequest: makeRequest())
        if controller != nil {
            controller!.delegate = self
            present(controller!, animated: true)
        }
   
}

    
}
// MARK: - table View Delegate

extension PaymentOptionsViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
        for row in 0..<tableView.numberOfRows(inSection: indexPath.section) {
            if let cell = tableView.cellForRow(at: IndexPath(row: row, section: indexPath.section)) {
                cell.accessoryType = row == indexPath.row ? .checkmark : .none
            }
        }
        // payonline
        if (indexPath.row == 0 ){            
            tapForPay()
            typeOfPay = "Pay Online"
            countinueLBLbtn.isHidden = false

        }
        else
        {
            // MARK: - show alert when cost > ..

            if totalCost >= 20000 {
                            let alert = UIAlertController(title: "Error", message: "You Must Pay online ", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                
                countinueLBLbtn.isHidden = true
                
            }
            
            typeOfPay = "Pay Cash"


        }
    }
}

// MARK: - table View Data Source
extension PaymentOptionsViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "paymentoptions", for: indexPath) as! PaymentOptionsTableViewCell
        cell.paymentOptionslbl.text = options[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
// MARK: -  PKPaymentAuthorizationViewControllerDelegate


extension PaymentOptionsViewController: PKPaymentAuthorizationViewControllerDelegate {

    func paymentAuthorizationViewControllerDidFinish(_ controller: PKPaymentAuthorizationViewController) {

        controller.dismiss(animated: true, completion: nil)

    }

    func paymentAuthorizationViewController(_ controller: PKPaymentAuthorizationViewController, didAuthorizePayment payment: PKPayment, handler completion: @escaping (PKPaymentAuthorizationResult) -> Void) {

        completion(PKPaymentAuthorizationResult(status: .success, errors: nil))

    }
}

