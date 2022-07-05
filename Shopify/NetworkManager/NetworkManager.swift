//
//  NetworkManager.swift
//  Shopify
//
//  Created by Ahmed on 04/07/2022.
//

import Foundation
class NetworkManger : ApiService {
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
    
    
}
