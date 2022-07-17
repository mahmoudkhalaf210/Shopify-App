//
//  addressInMeViewController.swift
//  Shopify
//
//  Created by Macintosh on 15/07/2022.
//

import UIKit

class addressInMeViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    var addresses = [AddressI]()
    var customerID : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataOfAddressesFromViewModel()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addAddressBtn(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "addaddress") as! AddNewAddressViewController
        vc.customerID = customerID
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    // MARK: - Func Fetch DAta OF Address
    func fetchDataOfAddressesFromViewModel(){
        print(customerID)
        let homeViewModel = HomeViewModelAddress( customerid: customerID)
        homeViewModel.fetchData()
        homeViewModel.bindingData = {branchs , error in
            
            if let branchs = branchs {
                self.addresses = branchs
                DispatchQueue.main.async { [self] in
                    print("addresses")
                    print(addresses)
                    self.myTableView.reloadData()
                }
            }
            if let error = error {
                print(error.localizedDescription)
            }
            
        }
        
    }
}
// MARK: - table View Data Source

extension addressInMeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addresses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addressMe", for: indexPath) as! AddressInMeTableViewCell
        
        cell.addressLbl.text = addresses[indexPath.row].address1
        
        cell.cityLbl.text = addresses[indexPath.row].city
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

}


