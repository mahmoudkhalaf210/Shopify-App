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
    var customerID : Int64 = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        customerID = Int64( Helper.shared.getUserID()!)
        print(customerID)
        print( Helper.shared.getUserStatus())
        
       Helper.shared.checkUserIsLogged { userLogged in

                    if userLogged{

                        self.goToMe()
                    }else{

                        self.goToLoginPage()
                    }

                }
      

        // Do any additional setup after loading the view.
        
        myTableView.register(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: "order")
        
    }
    
    @IBAction func moreOrdersBtn(_ sender: Any) {
        
       let vc = storyboard?.instantiateViewController(withIdentifier: "myorders") as! MyOrdersViewController
      
        vc.customerId = customerID
        vc.order = order
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func moreFavourites(_ sender: Any) {
        
        let vc2 = storyboard?.instantiateViewController(withIdentifier: "favouriteV") as! FavouriteViewController
       
        vc2.customerId = customerID
        
         navigationController?.pushViewController(vc2, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        orders = db.fetchDataOrderByCustomerId(appDelegate: appDelegate, CustomerId: customerID)
        
        /*
        for o in orders {
            db.deleteOrder(order: o, appDelegate: appDelegate)
        }
      */
    
        
        myTableView.reloadData()
        order = orders.last ?? Order()
       
    }
    @IBAction func goToSettingBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "setting") as! SettingViewController
       
        vc.customerId = Int(customerID)
        print(vc.customerId)
        
         navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    
    
   

}



extension MeViewController : UITableViewDelegate {}


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
    
       let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "GuestProfileViewController") as! GuestProfileViewController
    
    
    self.navigationItem.setHidesBackButton(true, animated: true)
    self.dismiss(animated: true)
   
}
func goToLoginPage(){
    
    
       let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "GuestProfileViewController") as! GuestProfileViewController
    
    
    self.navigationItem.setHidesBackButton(true, animated: true)
    self.navigationController?.pushViewController(loginVC, animated: true)
   
}
}
