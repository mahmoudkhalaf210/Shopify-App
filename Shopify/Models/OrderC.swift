//
//  OrderC.swift
//  Shopify
//
//  Created by Macintosh on 18/07/2022.
//

import Foundation

struct OrderItem : Codable{
    var variant_id : Int?
    var quantity:Int?
    var name:String?
    var price:String?
    var title:String?
}

struct OrderC : Codable{
    var id:Int?
    var customer:Customer?
    var line_items:[OrderItem]?
    var created_at:String?
    var financial_status: String = "paid"
    var current_total_price:String?
}

struct OrderToAPI : Codable{
    var order : OrderC
}

struct OrdersFromAPI : Codable {
    var orders : [OrderC]
}
