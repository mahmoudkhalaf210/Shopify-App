//
//  ViewController.swift
//  Shopify
//
//  Created by Mostafa Elbadawy on 04/07/2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    var loadingIndicator = UIActivityIndicatorView()
    let alert : UIAlertController = UIAlertController(title:"You Are Disconnected!" , message: "Please Connect to Network", preferredStyle: .alert)
    var brandArr:[SmartCollection] = []
    var filteredArray: [SmartCollection] = []
    let homeViewModel = HomeViewModel()
    let check =  Helper.shared.getUserStatus()
    let images = [UIImage(named: "vv"), UIImage(named: "aa"), UIImage(named: "bb")].compactMap{$0}
    
    
    var customerID : Int64? = 6261211300054
    
    @IBOutlet weak var brandCollectionView: UICollectionView!
    @IBOutlet weak var annnceImg: UIImageView!
    @IBOutlet weak var brandsSearchBar: UISearchBar!
    @IBAction func cartButton(_ sender: UIBarButtonItem) {
        
       // performSegue(withIdentifier: "shoppingcart", sender: nil)
        
        /*
        
        if check == true{
            let vc = UIStoryboard(name: "ShoppingCart", bundle: nil).instantiateViewController(withIdentifier: "ShoppingCartViewController") as! ShoppingCartViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else{
            let vc = UIStoryboard(name: "Authentication", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
        */
    }
    @IBAction func favoritButton(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  customerID = Helper.shared.getUserID()!
        
        print("__________________ customerID")
      //  print(customerID)
        
        configreView ()
        configCvAndSearch()
        fetchDataToHome()
        netMonitorAlert()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchDataToHome()
        if NetworkMonitor.shared.isConnected  {
            loadingIndicator.isHidden = true
        } else {
            loadingIndicator.startAnimating()
        }
        
    }
    func configreView () {
        annnceImg.animationImages = images
        annnceImg.animationDuration = 4
        annnceImg.startAnimating()
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
    }
    func configCvAndSearch() {
        brandCollectionView.dataSource = self
        brandCollectionView.delegate = self
        brandsSearchBar.delegate = self
    }
    func fetchDataToHome() {
        homeViewModel.fetchData()
        homeViewModel.bindingData = {brands , error in
            if let brands = brands {
                self.brandArr = brands
                self.filteredArray = self.brandArr
                DispatchQueue.main.async {
                    self.brandCollectionView.reloadData()
                }
            }
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    func netMonitorAlert() {
        loadingIndicator.style = .medium
        loadingIndicator.center = view.center
        view.addSubview(loadingIndicator)
        if NetworkMonitor.shared.isConnected  {
            print("you are connected")
            loadingIndicator.isHidden = true
        } else {
            loadingIndicator.startAnimating()
            self.present(alert, animated: true, completion: nil)
        }
    }

    
}
extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredArray.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let productVC = self.storyboard?.instantiateViewController(withIdentifier: "ProductViewController") as? ProductViewController {
            productVC.prandTitle = filteredArray[indexPath.row].title
            productVC.productID = filteredArray[indexPath.row].id
            productVC.customerid = customerID
            self.navigationController?.pushViewController(productVC, animated: true)
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "brandCell", for: indexPath) as! BrandCollectionViewCell
        cell.brandImg.downloaded(from: filteredArray[indexPath.row].image.src)
        cell.brandName.text = filteredArray[indexPath.row].title
        cell.brandImg.layer.borderWidth = 2
        cell.brandImg.layer.borderColor =  CGColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.8)
        return cell
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText == "" {
            filteredArray = brandArr
            self.brandCollectionView.reloadData()
        } else {
            filteredArray = brandArr.filter({ mod in
                return mod.title!.contains(searchText.uppercased())
            })
            self.brandCollectionView.reloadData()
        }
    }
}
