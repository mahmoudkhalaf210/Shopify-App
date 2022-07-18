//
//  ApiServices.swift
//  Shopify
//
//  Created by Ahmed on 04/07/2022.
//

import Foundation

protocol ApiService {
    func fetchbranchs(endPoint : String , Completion : @escaping (([SmartCollection]? , Error?) -> Void))
    func fetchProduct(endPoint : String , Completion : @escaping (([Product]? , Error?) -> Void))
    func fetchCustomers(Completion : @escaping (([Customer]? , Error?) -> Void))
    func register(endPoint: String,newCustomer:NewCustomer, completion:@escaping (Data?, URLResponse? , Error?)->())
    func createAddress(customerId: Int, address: Address, completion: @escaping(Data?, URLResponse?, Error?)->())
    func fetchCategory(endPoint : String , Completion : @escaping (([Custom_collections]? , Error?) -> Void))
    
    func SubmitOrder (order : OrderToAPI , Completion : @escaping((Data? , URLResponse? , Error?) -> Void ))

    
}
