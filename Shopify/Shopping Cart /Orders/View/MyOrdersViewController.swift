//
//  MyOrdersViewController.swift
//  Shopify
//
//  Created by Macintosh on 15/07/2022.
//

import UIKit

class MyOrdersViewController: UIViewController {
    @IBOutlet weak var MytableView: UITableView!
    
    
    var db = DBmanger.sharedInstance
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var numbersOfOrders = [Int64]()
    var integersOrderedSet = [Int64]()
    
    var orders = [Orders]()
    var order = Order()
    var customerId : Int64 = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        MytableView.register(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: "order")
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        orders = db.fetchOrdersById(appDelegate: appDelegate, customerid: customerId)
     
        // delete orders
      /* for order in ordersS {
            db.deleteOrder(order: order, appDelegate: appDelegate)
        }*/
        
    
        MytableView.reloadData()
    }


}


extension MyOrdersViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "orderitem") as! OrderViewController
        
        vc.total = orders[indexPath.row].total 
        vc.time = orders[indexPath.row].time!
        vc.numberOfOrder = orders[indexPath.row].number
        vc.customerId = customerId
         navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension MyOrdersViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "order", for: indexPath) as! OrderTableViewCell
            
            cell.TotalPriceLbl.text = "\(orders[indexPath.row].total)"
            cell.createdAtLbl.text = "\(orders[indexPath.row].time!)"
            
            return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    
}









extension RangeReplaceableCollection where Element: Hashable {
    var orderedSet: Self {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
    mutating func removeDuplicates() {
        var set = Set<Element>()
        removeAll { !set.insert($0).inserted }
    }
}
