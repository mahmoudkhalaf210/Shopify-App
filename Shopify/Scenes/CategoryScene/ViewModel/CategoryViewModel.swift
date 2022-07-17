//
//  CategoryViewModel.swift
//  Shopify
//
//  Created by Ahmed on 09/07/2022.
//

import Foundation
class CategoryViewModel{
var categoryArray: [ Custom_collections]? {
    didSet {
        bindingData(categoryArray,nil)
    }
}
var error: Error? {
    didSet {
        bindingData(nil, error)
    }
}
let apiService : ApiService  // create api service object
var bindingData: (([Custom_collections]?,Error?) -> Void) = {_, _ in }
init(apiService: ApiService = NetworkManger()) {
    self.apiService = apiService
}



func fetchData() {
    apiService.fetchCategory(endPoint: "custom_collections.json") { category, error in
        if let category = category {
            self.categoryArray = category
        }
        
        if let error = error {
            self.error = error
        }
        
    }
    
    
    
    

}



}
