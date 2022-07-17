//
//  DBmanger.swift
//  Shopify
//
//  Created by Macintosh on 05/07/2022.
//

import Foundation
import CoreData




protocol DeletionDelegate{
    func deleteMovieAtIndexPath(indexPath: IndexPath)
}


class DBmanger {
    
    static let sharedInstance = DBmanger()
    private init(){}
    
}


extension DBmanger {
    
    
    func addCartItem(appDelegate : AppDelegate , CartItem : CartItem) {
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "CartItem", in: managedContext)
        
        let cartItem = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        cartItem.setValue(CartItem.numOfItem, forKey: "numOfItem")
        cartItem.setValue(CartItem.productId, forKey: "productId")
        cartItem.setValue(CartItem.productImg, forKey: "productImg")
        cartItem.setValue(CartItem.productTitle, forKey: "productTitle")
        cartItem.setValue(CartItem.productType, forKey: "productType")
        cartItem.setValue(CartItem.price, forKey: "price")
        
        do {
            try managedContext.save()
            print("data Saved in cart")
        }
        catch{
            print("error in saving item in cart ")

            print(error.localizedDescription)
        }
    }
    
    func addCartItem(appDelegate : AppDelegate , productId : Int64 , productImg : String , productTitle : String , productType : String , productPrice : Double , numofitem:Int16 ) {
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "CartItem", in: managedContext)
        
        let cartItem = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        cartItem.setValue(productId, forKey: "productId")
        cartItem.setValue(numofitem, forKey: "numOfItem")
        cartItem.setValue(productImg, forKey: "productImg")
        cartItem.setValue(productTitle, forKey: "productTitle")
        cartItem.setValue(productType, forKey: "productType")
        cartItem.setValue(productPrice, forKey: "price")
        
        do {
            try managedContext.save()
            print("data Saved in cart")
        }
        catch{
            print("error in saving item in cart ")
            print(error.localizedDescription)
        }
    }
    
    
    func addOrderItem(appDelegate : AppDelegate , customerId : Int64 , price : Double , title : String , typeOfPay : String , total : Double , numofitem : Int16 , time : Date , address : String , number : Int64 , imageitem : String) {
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Order", in: managedContext)
        
        let cartItem = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        cartItem.setValue(customerId, forKey: "customerId")
        cartItem.setValue(price, forKey: "price")
        cartItem.setValue(title, forKey: "title")
        cartItem.setValue(typeOfPay, forKey: "typeOfPay")
        cartItem.setValue(total, forKey: "total")
        cartItem.setValue(numofitem, forKey: "numofitem")
        cartItem.setValue(time, forKey: "time")
        cartItem.setValue(address, forKey: "address")
        cartItem.setValue(number, forKey: "number")
        cartItem.setValue(imageitem, forKey: "imageitem")
        
        do {
            try managedContext.save()
            print("Order saved")
        }
        catch{
            print("error in saved order ")
            print(error.localizedDescription)
        }
    }
    
    func addOrders(appDelegate : AppDelegate , customerid : Int64 , total : Double  , time : Date  , number : Int64 ) {
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Orders", in: managedContext)
        
        let cartItem = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        cartItem.setValue(customerid, forKey: "customerid")
        cartItem.setValue(total, forKey: "total")
        cartItem.setValue(time, forKey: "time")
        cartItem.setValue(number, forKey: "number")
        
        do {
            try managedContext.save()
            print("Order saved")
        }
        catch{
            print("error in saved order ")
            print(error.localizedDescription)
        }
    }
    
    
    func addOrdertoFavourite(appDelegate : AppDelegate , customerid : Int64 , price : Double , title : String  , image : String) {
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Favourite", in: managedContext)
        
        let cartItem = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        cartItem.setValue(customerid, forKey: "customerid")
        cartItem.setValue(price, forKey: "price")
        cartItem.setValue(title, forKey: "title")
        cartItem.setValue(image, forKey: "image")

        
        do {
            try managedContext.save()
            print("product saved in favourite")
        }
        catch{
            print("error in saved product in favourite ")
            print(error.localizedDescription)
        }
    }
    
    
    
    func IncreaseCounter(appDelegate : AppDelegate , counter : Int64 ) {
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "CounterOfOrder", in: managedContext)
        
        let cartItem = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        cartItem.setValue(counter, forKey: "numoforder")
       
        
        do {
            try managedContext.save()
            print("data Saved in counter")
        }
        catch{
            print("error in saving item in counter ")
            print(error.localizedDescription)
        }
    }
    
    
    
    
    func delete(cartItem :CartItem , indexPath: IndexPath, appDelegate: AppDelegate, delegate: DeletionDelegate){
        
        let managedContext = appDelegate.persistentContainer.viewContext
        managedContext.delete(cartItem)
        do{
            try managedContext.save()
            delegate.deleteMovieAtIndexPath(indexPath: indexPath)
        }catch let error as NSError{
            print("Error in saving")
            print(error.localizedDescription)
        }
        
    }
    
    
    func delete(leagueItem :CartItem , appDelegate: AppDelegate){
        
        let managedContext = appDelegate.persistentContainer.viewContext
        managedContext.delete(leagueItem)
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("Error in saving")
            print(error.localizedDescription)
        }
        
    }
    
    func deleteOrder(order : Order , appDelegate: AppDelegate){
        
        let managedContext = appDelegate.persistentContainer.viewContext
        managedContext.delete(order)
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("Error in saving")
            print(error.localizedDescription)
        }
        
    }
    
    
    func deleteProductInFavourite(product : Favourite , appDelegate: AppDelegate){
        
        let managedContext = appDelegate.persistentContainer.viewContext
        managedContext.delete(product)
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("Error in saving")
            print(error.localizedDescription)
        }
        
    }
    
    
    func deleteCounter(numb : CounterOfOrder , appDelegate: AppDelegate){
        
        let managedContext = appDelegate.persistentContainer.viewContext
        managedContext.delete(numb)
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("Error in saving")
            print(error.localizedDescription)
        }
        
    }
    
    
    
    
    func fetchDataCart(appDelegate : AppDelegate) -> [CartItem] {
        
        var fetchedList : [CartItem] = []
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CartItem")

        do {
            fetchedList = try managedContext.fetch(fetchRequest) as! [CartItem]
            print("data fetched in Cart")
            
            
        } catch let error as NSError {
            print("error in fetch data From Cart")
            print(error.localizedDescription)
        }

        return fetchedList
    }
    
    
    func fetchDataOfCounter(appDelegate : AppDelegate) -> [CounterOfOrder] {
        
        var fetchedList: [CounterOfOrder] = []
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CounterOfOrder")

        do {
            fetchedList = try (managedContext.fetch(fetchRequest) as! [CounterOfOrder]);   print("data fetched in Counter")
            
            
        } catch let error as NSError {
            print("error in fetch data From Counter")
            print(error.localizedDescription)
        }

        return fetchedList
    }
    
    
    
    
    func fetchDataOrderByCustomerId(appDelegate : AppDelegate , CustomerId: Int64) -> [Order] {
        
        var fetchedList : [Order] = []
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Order")
        
        let predicate = NSPredicate(format: "customerId == %@","\(CustomerId)")
        fetchRequest.predicate = predicate
        do {
            fetchedList = try managedContext.fetch(fetchRequest) as! [Order]
            print("data fetched in order")
            
            
        } catch let error as NSError {
            print("error in fetch data From order")
            print(error.localizedDescription)
        }

        return fetchedList
    }
    
    
    func fetchDataOrderByCustomerIdAndNum(appDelegate : AppDelegate , CustomerId: Int64 , number : Int64) -> [Order] {
        
        var fetchedList : [Order] = []
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Order")
        
        let predicate = NSPredicate(format: "customerId == %@","\(CustomerId)")
        fetchRequest.predicate = predicate
        let predicate2 = NSPredicate(format: "number == %@","\(number)")
        fetchRequest.predicate = predicate2

        do {
            fetchedList = try managedContext.fetch(fetchRequest) as! [Order]
            print("data fetched in order")
            
            
        } catch let error as NSError {
            print("error in fetch data From order")
            print(error.localizedDescription)
        }

        return fetchedList
    }
    
    
    func fetchOrdersById(appDelegate : AppDelegate , customerid : Int64) -> [Orders] {
        
        var fetchedList : [Orders] = []
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Orders")
        let predicate = NSPredicate(format: "customerid == %@","\(customerid)")
        fetchRequest.predicate = predicate
        do {
            fetchedList = try managedContext.fetch(fetchRequest) as! [Orders]
            print("data fetched in Cart")
            
            
        } catch let error as NSError {
            print("error in fetch data From Cart")
            print(error.localizedDescription)
        }

        return fetchedList
    }
    
    func fetchFavouriteById(appDelegate : AppDelegate , customerid : Int64) -> [Favourite] {
        
        var fetchedList : [Favourite] = []
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Favourite")
        let predicate = NSPredicate(format: "customerid == %@","\(customerid)")
        fetchRequest.predicate = predicate
        do {
            fetchedList = try managedContext.fetch(fetchRequest) as! [Favourite]
            print("data fetched in Cart")
            
            
        } catch let error as NSError {
            print("error in fetch data From Cart")
            print(error.localizedDescription)
        }

        return fetchedList
    }
    
    
    
    
    
}
