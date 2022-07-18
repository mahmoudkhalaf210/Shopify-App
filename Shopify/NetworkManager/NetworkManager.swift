//
//  NetworkManager.swift
//  Shopify
//
//  Created by Ahmed on 04/07/2022.
//

//
//  NetworkManager.swift
//  BasicStructure
//
//  Created by Ibrahem's on 04/07/2022.
//

import Foundation


class NetworkManger : ApiService {
    
    
    func SubmitOrder(order: OrderToAPI, Completion: @escaping ((Data?, URLResponse?, Error?) -> Void)) {
        guard let url = URL(string: UrlService(endPoint: "orders.json").url) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let session = URLSession.shared
        request.httpShouldHandleCookies = false
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: order.asDictionary(), options: .prettyPrinted)
            print(try! order.asDictionary())
        }catch let error {
            print(error.localizedDescription)
        }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    //        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        session.dataTask(with: request) { data, response, error in
            Completion(data , response , error)
        }.resume()
    }
    
    
    func createAddress(customerId: Int, address: Address, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        let customer = CustomerAddress(addresses: [address])
        let putObject = PutAddress(customer: customer)
        let urlStr = UrlService(endPoint: "customers/\(customerId).json" ).url
        print("HELP\(customerId)")
        guard let url = URL(string: urlStr) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        let session = URLSession.shared
        request.httpShouldHandleCookies = false
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: putObject.asDictionary(), options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }
        
        //HTTP Headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        session.dataTask(with: request) { (data, response, error) in
            completion(data, response, error)
        }.resume()
    }
    
    
    func fetchbranchs(endPoint: String, Completion: @escaping (([SmartCollection]?, Error?) -> Void)) {
        var arrayOfBranchs = [SmartCollection]()
        
        if let url = URL(string: UrlService(endPoint: endPoint).url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let insideData = data {
                    print(insideData)
                    let decodeArray : SmartCollectionsModel? = convertFromJson(data: insideData)
                    arrayOfBranchs = decodeArray!.smart_collections
                    print("decode array \(arrayOfBranchs)")
                    Completion(arrayOfBranchs , nil)
                }
                if let errorInside = error {
                    Completion(nil , errorInside)
                }
            }.resume()
        }
    }
    
    func fetchProduct(endPoint: String, Completion: @escaping (([Product]?, Error?) -> Void)) {
        var arrayOfBranchs = [Product]()

        if let url = URL(string: UrlService(endPoint: endPoint).url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let insideData = data {
                    print(insideData)
                    let decodeArray : AllProducts? = convertFromJson(data: insideData)
                    arrayOfBranchs = decodeArray!.products!
                    print("decode array \(arrayOfBranchs)")
                    Completion(arrayOfBranchs , nil)
                }
                if let errorInside = error {
                    Completion(nil , errorInside)
                }
            }.resume()
        }
    }
    
    func fetchCustomers(Completion: @escaping (([Customer]?, Error?) -> Void)) {
        var arrayOfCustomers = [Customer]()

        if let url = URL(string: UrlService(endPoint: "customers.json").url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let insideData = data {
                    print(insideData)
                    let decodeArray : Customers? = convertFromJson(data: insideData)
                    arrayOfCustomers = decodeArray!.customers
                    print("decode array \(arrayOfCustomers)")
                    Completion(arrayOfCustomers , nil)
                }
                if let errorInside = error {
                    Completion(nil , errorInside)
                }
            }.resume()
        }
    }
    
    // POST Function
    func register(endPoint: String,newCustomer:NewCustomer, completion:@escaping (Data?, URLResponse? , Error?)->()){
        if let url = URL(string: UrlService(endPoint: endPoint).url) {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            let session = URLSession.shared
            request.httpShouldHandleCookies = false
            
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: newCustomer.asDictionary(), options: .prettyPrinted)
                print(try! newCustomer.asDictionary())
            } catch let error {
                print(error.localizedDescription)
            }
            
            //HTTP Headers
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            session.dataTask(with: request) { (data, response, error) in
                completion(data, response, error)
            }.resume()
        }
    }
    
    func fetchCategory(endPoint: String, Completion: @escaping (([Custom_collections]?, Error?) -> Void)) {
        var arrayOfCategory = [Custom_collections]()
       
               if let url = URL(string: UrlService(endPoint: endPoint).url) {
                   URLSession.shared.dataTask(with: url) { data, response, error in
                       if let insideData = data {
                           print(insideData)
                           let decodeArray : Json4Swift_Base? = convertFromJson(data: insideData)
                           arrayOfCategory = decodeArray?.custom_collections ?? []
                           print("decode array \(arrayOfCategory)")
                           Completion(arrayOfCategory , nil)
                       }
                       if let errorInside = error {
                           Completion(nil , errorInside)
                       }
                   }.resume()
               }
           }
    
}
    
 

    //MARK: - Addresses
    func createAddress(customerId: Int, address: Address, completion: @escaping(Data?, URLResponse?, Error?)->()){
        let customer = CustomerAddress(addresses: [address])
        let putObject = PutAddress(customer: customer)
        let urlStr = UrlService(endPoint: "customers/\(customerId).json" ).url
        print("HELP\(customerId)")
        guard let url = URL(string: urlStr) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        let session = URLSession.shared
        request.httpShouldHandleCookies = false
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: putObject.asDictionary(), options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }
        
        //HTTP Headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        session.dataTask(with: request) { (data, response, error) in
            completion(data, response, error)
        }.resume()
    }
    
    func setDefaultAddress(customerId: Int, addressId: Int, address: Address, completion: @escaping(Data?, URLResponse?, Error?)->()){

        let customer = CustomerAddress(addresses: [address])
        let putObject = PutAddress(customer: customer)
        let urlStr = UrlService(endPoint: "customers/\(customerId).json" ).url
        guard let url = URL(string: urlStr) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        let session = URLSession.shared
        request.httpShouldHandleCookies = false
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: putObject.asDictionary(), options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }
        
        //HTTP Headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        session.dataTask(with: request) { (data, response, error) in
            completion(data, response, error)
        }.resume()
    }
    func getAllAddresses(completion: @escaping ([Address]?, Error?)-> Void){
        var arrayOfAddresses = [Address]()
        guard let customerID = Helper.shared.getUserID() else {return}
        if let url = URL(string: UrlService(endPoint: "customers/\(customerID)/addresses.json").url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let insideData = data {
                    print(insideData)
                    let decodeArray : CustomerAddress? = convertFromJson(data: insideData)
                    arrayOfAddresses = decodeArray!.addresses ?? []
                    print("decode array \(arrayOfAddresses)")
                    completion(arrayOfAddresses , nil)
                }
                if let errorInside = error {
                    completion(nil , errorInside)
                }
            }.resume()
        }
        
        



    }
