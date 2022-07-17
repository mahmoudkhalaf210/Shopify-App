//
//  ProductDetailsViewController.swift
//  Shopify
//
//  Created by Mostafa Elbadawy on 04/07/2022.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    
    
    var customerid : Int64?

    var product : Product?
    
    var db = DBmanger.sharedInstance
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    var passedDataToProductDetailsVC : Product?
    var passedDataToProductDetailsVC2 : Product?
    
    var itemPrice : String = ""
    var imageURL : String = ""
    
    @IBOutlet weak var productImagesCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var productPriceLbl: UILabel!
    @IBOutlet weak var ratingImage: UIImageView!
    @IBOutlet weak var discriptionLbl: UILabel!
    
    @IBAction func addToCartBtn(_ sender: UIButton) {
        
        if passedDataToProductDetailsVC != nil {
           
        
            db.addCartItem(appDelegate: appDelegate, productId: Int64(passedDataToProductDetailsVC?.id ?? 0) , productImg: passedDataToProductDetailsVC?.image?.src ?? "" , productTitle: passedDataToProductDetailsVC?.title ?? "", productType: passedDataToProductDetailsVC?.product_type ?? "", productPrice: Double(itemPrice) ?? 0.0 , numofitem: 1)
            
            
        }else {
            
            db.addCartItem(appDelegate: appDelegate, productId: Int64(passedDataToProductDetailsVC2?.id ?? 0) , productImg: passedDataToProductDetailsVC2?.image?.src ?? "" , productTitle: passedDataToProductDetailsVC2?.title ?? "", productType: passedDataToProductDetailsVC2?.product_type ?? "", productPrice: Double((passedDataToProductDetailsVC2?.variants![0].price)! ) ?? 0.0 , numofitem: 1)
            
        }
        
        
    }
    @IBAction func addToFavoriteBtn(_ sender: UIButton) {
        
        if passedDataToProductDetailsVC != nil {
           
            db.addOrdertoFavourite(appDelegate: appDelegate, customerid: customerid!, price: Double(itemPrice) ?? 0.0, title: passedDataToProductDetailsVC?.title ?? "", image: passedDataToProductDetailsVC?.image?.src ?? "")
    
            
        }else {
            
            db.addOrdertoFavourite(appDelegate: appDelegate, customerid: customerid!, price: Double(itemPrice) ?? 0.0, title: passedDataToProductDetailsVC2?.title ?? "", image: passedDataToProductDetailsVC2?.image?.src ?? "")
      
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        productImagesCollectionView.register(UINib(nibName: "ProductDetailsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "ProductDetailsCollectionViewCell")
        
        productImagesCollectionView.delegate = self
        productImagesCollectionView.dataSource = self
        ConfigView()


        
    }
    func ConfigView() {
        if passedDataToProductDetailsVC != nil{
            productNameLbl.text = passedDataToProductDetailsVC?.title
            discriptionLbl.text = passedDataToProductDetailsVC?.body_html
            for item in (passedDataToProductDetailsVC?.variants)! {
                itemPrice = item.price!
                break
            }
            productPriceLbl.text = "Price: \(itemPrice) USD"
        } else {
            productNameLbl.text = passedDataToProductDetailsVC2?.title
            discriptionLbl.text = passedDataToProductDetailsVC2?.body_html
            for item in (passedDataToProductDetailsVC2?.variants)! {
                itemPrice = item.price!
                break
            }
            productPriceLbl.text = "Price: \(itemPrice) USD"
        }
    }
    
}
extension ProductDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if passedDataToProductDetailsVC != nil {
            return (passedDataToProductDetailsVC?.images!.count)!
        } else {
            return (passedDataToProductDetailsVC2?.images!.count)!
        }
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.section
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = productImagesCollectionView.dequeueReusableCell(withReuseIdentifier: "ProductDetailsCollectionViewCell", for: indexPath) as! ProductDetailsCollectionViewCell

        if passedDataToProductDetailsVC != nil {
            switch indexPath.row {
            case 0:
                cell.productDetailsImage.downloaded(from: (passedDataToProductDetailsVC?.images![0].src)!)
                break
            case 1:
                cell.productDetailsImage.downloaded(from: (passedDataToProductDetailsVC?.images![1].src)!)
                break
            case 2:
                cell.productDetailsImage.downloaded(from: (passedDataToProductDetailsVC?.images![2].src)!)
                break
            default:
                break
            }
       } else {
           switch indexPath.row {
           case 0:
               cell.productDetailsImage.downloaded(from: (passedDataToProductDetailsVC2?.images![0].src)!)
               break
           case 1:
               cell.productDetailsImage.downloaded(from: (passedDataToProductDetailsVC2?.images![1].src)!)
               break
           case 2:
               cell.productDetailsImage.downloaded(from: (passedDataToProductDetailsVC2?.images![2].src)!)
               break
           default:
               break
           }
        }
        return cell
    }


}
extension ProductDetailsViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
//        let leftAndRightPaddings: CGFloat = 1
//        let numberOfItemsPerRow: CGFloat = 1.0
//        let width = (collectionView.frame.width-leftAndRightPaddings)/numberOfItemsPerRow
//        return CGSize(width: width, height: 200)
    }

}

