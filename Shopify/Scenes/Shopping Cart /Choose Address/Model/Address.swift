//
//  Address.swift
//  Shopify
//
//  Created by Macintosh on 07/07/2022.
//

import Foundation

// MARK: - Welcome
struct AddressesI : Codable {
    let addresses: [AddressI]
}

// MARK: - Address
struct AddressI : Codable{
    let id, customerID: Int?
    let firstName, lastName: String?
    let address1: String?
    let address2: String?
    let city, province, country, zip: String?
    let phone, name: String?
    let provinceCode: String?
    let countryCode, countryName: String?
}
