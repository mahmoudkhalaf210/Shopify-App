//
//  HomeViewModel.swift
//  Shopify
//
//  Created by Mostafa Elbadawy on 04/07/2022.
//

import Foundation
class HomeViewModel {
    var usersArray: [SmartCollection]? {
        didSet {
            bindingData(usersArray,nil)
        }
    }
    var error: Error? {
        didSet {
            bindingData(nil, error)
        }
    }
    let apiService : ApiService  // create api service object
    var bindingData: (([SmartCollection]?,Error?) -> Void) = {_, _ in }
    init(apiService: ApiService = NetworkManger()) {
        self.apiService = apiService
    }
    
    
    
    func fetchData() {
        apiService.fetchbranchs(endPoint: "smart_collections.json") { branchs, error in
            if let branchs = branchs {
                self.usersArray = branchs
            }
            
            if let error = error {
                self.error = error
            }
            
        }
        
        
        
        
    
    }
    
    
    
}
