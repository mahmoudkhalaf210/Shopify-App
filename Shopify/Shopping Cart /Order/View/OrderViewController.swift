//
//  OrderViewController.swift
//  Shopify
//
//  Created by Macintosh on 15/07/2022.
//

import UIKit

class OrderViewController: UIViewController {

    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var totalLbl: UILabel!
    @IBOutlet weak var myTableView: UITableView!
    
    var db = DBmanger.sharedInstance
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    var total = Double()
    var time = Date()
    var orders = [Order]()
    var customerId = Int64()
    var numberOfOrder = Int64()
    
    var name : String = ""
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name = Helper.shared.getUserName()!
    
        
        
        timeLbl.text = "\(name)"
        totalLbl.text = "\(total)"

        // Do any additional setup after loading the view.
        myTableView.register(UINib(nibName: "itemInOrderTableViewCell", bundle: nil), forCellReuseIdentifier: "item")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        orders = db.fetchDataOrderByCustomerIdAndNum(appDelegate: appDelegate, CustomerId: customerId, number: numberOfOrder)
        
        for order in orders {
            print(order)
        }
    }


    // MARK: - Navigation
    
    


}

extension OrderViewController : UITableViewDelegate {}

extension OrderViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath) as! itemInOrderTableViewCell
        
        cell.itemTitleLbl.text = "\(orders[indexPath.row].title ?? "")"
        cell.itempriceLbl.text = "\(orders[indexPath.row].price)"
        cell.numOfItemLbl.text = "\(orders[indexPath.row].numofitem)"
        
        cell.imageItem.downloaded(from: orders[indexPath.row].imageitem!)

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}
