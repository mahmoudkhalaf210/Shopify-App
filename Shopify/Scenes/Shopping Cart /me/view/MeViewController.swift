//
//  MeViewController.swift
//  Shopify
//
//  Created by Macintosh on 15/07/2022.
//

import UIKit

class MeViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    var db = DBmanger.sharedInstance
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    
    var orders = [Order]()
    var order = Order()
  //  var customerID : Int64 = 6261211300054
    var customerID : Int64?
    override func viewDidLoad() {
        super.viewDidLoad()
    
    
        checkLogin()


        // Do any additional setup after loading the view.
        
        myTableView.register(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: "order")
        
    }
    
    // MARK: -  btn more order data

    @IBAction func moreOrdersBtn(_ sender: Any) {
        
       let vc = storyboard?.instantiateViewController(withIdentifier: "myorders") as! MyOrdersViewController
      
        vc.customerId = customerID ?? 00
        vc.order = order
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: -  button favourites

    @IBAction func moreFavourites(_ sender: Any) {
        
        let vc2 = storyboard?.instantiateViewController(withIdentifier: "favouriteV") as! FavouriteViewController
       
        vc2.customerId = customerID
        
         navigationController?.pushViewController(vc2, animated: true)
    }
    
    // MARK: -  func checklogin

    func checkLogin(){
        
        customerID = Int64( Helper.shared.getUserID()!)

        
      Helper.shared.checkUserIsLogged { userLogged in

                    if !userLogged{

                        let alert = UIAlertController(title: "Check Login", message: " please go to login page and login ", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
                        alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        
                        self.customerID = 0
                    }
          else {
              self.goToMe()
          }
      }
    }
    // MARK: -  will appear

    
    override func viewWillAppear(_ animated: Bool) {
        checkLogin()
        
        orders = db.fetchDataOrderByCustomerId(appDelegate: appDelegate, CustomerId: customerID ?? 00)
        
        /*
        for o in orders {
            db.deleteOrder(order: o, appDelegate: appDelegate)
        }
      */
        myTableView.reloadData()
        order = orders.last ?? Order()
       
    }
    
    // MARK: -  btn setting

    @IBAction func goToSettingBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "setting") as! SettingViewController
       
        vc.customerId = Int(customerID ?? 0)
        print(vc.customerId)
        
         navigationController?.pushViewController(vc, animated: true)
        
    }
}

// MARK: -  table view delegate


extension MeViewController : UITableViewDelegate {}

// MARK: -  table view data source

extension MeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "order", for: indexPath) as! OrderTableViewCell
        
        if orders.count == 0 {
            cell.TotalPriceLbl.text = "Empty"
            cell.createdAtLbl.text = "Empty"
        }else {
        cell.TotalPriceLbl.text = "\(order.total)" 
        cell.createdAtLbl.text = "\(order.time!)"
        return cell
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
}


//MARK: - Check For Login Functions
extension MeViewController {

func goToMe(){
    
  //     let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "me") as! MeViewController
    
    
  //  self.navigationItem.setHidesBackButton(true, animated: true)
  //  self.dismiss(animated: true)
   
}

}
