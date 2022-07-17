//
//  Customer.swift
//  Shopify
//
//  Created by Mostafa Elbadawy on 13/07/2022.
//

import Foundation

import Foundation

struct NewCustomer: Codable {
    let customer: Customer
}

struct Customers: Codable {
    let customers: [Customer]
}

struct Customer: Codable {
    let first_name, last_name, email, phone, tags: String?
    let id: Int?
    let verified_email: Bool?
    let addresses: [Address]?
}
/*
struct Address : Codable{
    let id, customerID: Int?
    let firstName, lastName: String?
    let address1: String?
    let address2: String?
    let city, province, country, zip: String?
    let phone, name: String?
    let provinceCode: String?
    let countryCode, countryName: String?
}
 */
struct Address: Codable {
    var address1, city, province, phone: String?
    var zip, last_name, first_name, country: String?
    let id: Int?
}



struct LoginResponse: Codable {
    let customers: [Customer]
}

struct CustomerAddress: Codable {
    var addresses: [Address]?
}

struct UpdateAddress: Codable {
    var address: Address
}

struct PutAddress: Codable {
    let customer: CustomerAddress?
}
