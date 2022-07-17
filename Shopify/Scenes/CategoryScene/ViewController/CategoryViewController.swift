//
//  CategoryViewController.swift
//  Shopify
//
//  Created by Ahmed on 04/07/2022.
//

import UIKit

class CategoryViewController: UIViewController {
    var loadingIndicator = UIActivityIndicatorView()
    let alert : UIAlertController = UIAlertController(title:"You Are Disconnected!" , message: "Please Connect to Network", preferredStyle: .alert)
    @IBOutlet weak var popUpProduct: UIButton!
    
    @IBOutlet weak var categorySearchbar: UISearchBar!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    
    var customerid : Int64? = 6261211300054
    
    var arrayOfProducts:[Product] = []
    var categoryArray:[Custom_collections] = []
    var mensArray:[Product] = []
    var filteredArray: [Product] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setPopUpFunc()
        netMonitorAlert()
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        categorySearchbar.delegate = self
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.reloadData()
        self.filteredArray = self.mensArray
        fetchProduct()
        func fetchCategory(){
            let categoryViewModel = CategoryViewModel()
            categoryViewModel.fetchData()
            categoryViewModel.bindingData = {category , error in
                
                if let category = category {
                    self.categoryArray = category
                    DispatchQueue.main.async {
                        self.categoryCollectionView.reloadData()
                    }
                }
                if let error = error {
                    print(error.localizedDescription)
                }
                
            }
            
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchProduct()
        if NetworkMonitor.shared.isConnected  {
            loadingIndicator.isHidden = true
        } else {
            loadingIndicator.startAnimating()
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
    //MARK: - popup function
    func setPopUpFunc(){
        
        let optionAccessories = {(action:UIAction)in
            self.mensArray.removeAll()
            var subString2 = "ACCESSORIES"
            for product in self.arrayOfProducts{
               // print("product = \(product.title)")
                if let tags = product.product_type{
                    print("product = \(tags)")
                    if tags.contains(subString2){
                        
                        self.mensArray.append(product)
                        
                    }
                    
                                }
                

    //
            }
            print("product = \(self.mensArray)")
            self.categoryCollectionView.reloadData()
        

            
            
            print(action.title)}
        let optionTSHirts = {(action:UIAction)in
            self.mensArray.removeAll()
            var subString2 = "T-SHIRTS"
            for product in self.arrayOfProducts{
               // print("product = \(product.title)")
                if let tags = product.product_type{
                    print("product = \(tags)")
                    if tags.contains(subString2){
                        
                        self.mensArray.append(product)
                        
                    }
                    
                                }
                

    //
            }
            print("product = \(self.mensArray)")
            self.categoryCollectionView.reloadData()
        

            
            print(action.title)}
        
        let optionShoes = {(action:UIAction)in
            self.mensArray.removeAll()
            var subString2 = "SHOES"
            for product in self.arrayOfProducts{
               // print("product = \(product.title)")
                if let tags = product.product_type{
                    print("product = \(tags)")
                    if tags.contains(subString2){
                        
                        self.mensArray.append(product)
                        
                    }
                    
                                }
                

    //
            }
            print("product = \(self.mensArray)")
            self.categoryCollectionView.reloadData()
        
            
        }
        popUpProduct.menu = UIMenu(children :[UIAction(title:"shoes",state: .on,handler: optionShoes),UIAction(title:"T-shirt",handler:optionTSHirts ),UIAction(title:"accessories",handler:optionAccessories )])
        popUpProduct.showsMenuAsPrimaryAction = true
        popUpProduct.changesSelectionAsPrimaryAction = true
        
    }
    
  
    //MARK: - FETCH PRODUCT
    func fetchProduct(){
        let productViewModel1 = ProductViewModel()
        productViewModel1.fetchProduct(endPoint: "products.json?")
        
        productViewModel1.bindingData = {product,error in
            if let products = product{
                self.arrayOfProducts = products
                self.filteredArray = self.arrayOfProducts
                DispatchQueue.main.async {
                    self.categoryCollectionView.reloadData()
                    
                }
                
            }
            if let error = error {
                print(error.localizedDescription)
            }
        }
      
        
//        print(self.arrayOfProducts)
//
//        DispatchQueue.main.async {
//            self.categoryCollectionView.reloadData()
//
//        }
    }
    
    // }
    
    
    
    
    
    //MARK: - FETCH CATEGORY
    func fetchCategory(){
     //   shAdow.image = UIImage(named: "")
        let categoryViewModel = CategoryViewModel()
        categoryViewModel.fetchData()
        categoryViewModel.bindingData = {category , error in
            
            if let category = category {
                self.categoryArray = category
                DispatchQueue.main.async {
                    
                }
                self.categoryCollectionView.reloadData()
                
            }
            
            if let error = error {
                print(error.localizedDescription)
            }
            
        }
        
    }
    
    @IBAction func saleBtn(_ sender: Any) {
      //  shAdow.image = UIImage(named: "")
        mensArray.removeAll()
        var subString2 = "sale"
        for product in self.arrayOfProducts{
           // print("product = \(product.title)")
            if let tags = product.tags{
                print("product = \(tags)")
                if tags.contains(subString2){
                    
                    mensArray.append(product)
                    
                }
                
                            }
            

//
        }
        print("product = \(mensArray)")
        categoryCollectionView.reloadData()
    

    }
    
    
    @IBAction func kidsBtn(_ sender: Any) {
   //     shAdow.image = UIImage(named: "")
        mensArray.removeAll()
        var subString2 = "kid"
        for product in self.arrayOfProducts{
           // print("product = \(product.title)")
            if let tags = product.tags{
                print("product = \(tags)")
                if tags.contains(subString2){
                    
                    mensArray.append(product)
                    
                }
                
                            }
            

//
        }
        print("product = \(mensArray)")
        categoryCollectionView.reloadData()
    

    }
    
    
    
    @IBAction func womenBtn(_ sender: Any) {
     //   shAdow.image = UIImage(named: "")
        mensArray.removeAll()
            var subString2 = "women"
            for product in self.arrayOfProducts{
               // print("product = \(product.title)")
                if let tags = product.tags{
                    print("product = \(tags)")
                    if tags.contains(subString2){
                        
                        mensArray.append(product)
                        
                    }
                    
                                }
                

    //
            }
            print("product = \(mensArray)")
            categoryCollectionView.reloadData()
        
    
        
    
    }

    
    
    
    
    @IBAction func menBtn(_ sender: Any) {
       // shAdow.image = UIImage(named: "")
        
        mensArray.removeAll()
        var subString = "men"
        for product in self.arrayOfProducts{
         
            if let tags = product.tags{
                print("product = \(tags)")
                if tags.contains(subString){
                    
                    mensArray.append(product)
                   
                }
                
                            }
            

//
        }
        
        print("product = \(mensArray)")
        categoryCollectionView.reloadData()
        
    }
   
    
}

extension CategoryViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return mensArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath)as! CategoryCollectionViewCell
        cell.titleC.text = mensArray[indexPath.row].title
        
        
        cell.productImg.downloaded(from: mensArray[indexPath.row].image!.src)
       cell.productImg.layer.borderWidth = 1.2
       cell.productImg.layer.borderColor =  CGColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.7)
        cell.productImg.layer.cornerRadius = 40.0
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let passedData = mensArray[indexPath.row]
        let vc = UIStoryboard(name: "ProductDetails", bundle: nil).instantiateViewController(withIdentifier: "ProductDetailsViewController") as! ProductDetailsViewController
        vc.passedDataToProductDetailsVC = passedData
       
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension CategoryViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText == "" {
            filteredArray = mensArray
            self.categoryCollectionView.reloadData()
        } else {
            filteredArray = mensArray.filter({ mod in
                return mod.title!.contains(searchText.uppercased())
            })
            self.categoryCollectionView.reloadData()
        }
    }

    
}
