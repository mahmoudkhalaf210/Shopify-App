//
//  Product.swift
//  Shopify
//
//  Created by Ahmed on 11/07/2022.
//


import Foundation
struct AllProducts : Codable {
    let products : [Product]?

    enum CodingKeys: String, CodingKey {

        case products = "products"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        products = try values.decodeIfPresent([Product].self, forKey: .products)
    }

}
struct Product : Codable {
    let id : Int?
    let title : String?
    let body_html : String?
    let vendor : String?
    let product_type : String?
    let created_at : String?
    let handle : String?
    let updated_at : String?
    let published_at : String?
    let template_suffix : String?
    let status : String?
    let published_scope : String?
    let tags : String?
    let admin_graphql_api_id : String?
    let variants : [VariantsProduct]?
    let options : [OptionsProduct]?
    let images : [ImagesProduct]?
    let image : Image?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case title = "title"
        case body_html = "body_html"
        case vendor = "vendor"
        case product_type = "product_type"
        case created_at = "created_at"
        case handle = "handle"
        case updated_at = "updated_at"
        case published_at = "published_at"
        case template_suffix = "template_suffix"
        case status = "status"
        case published_scope = "published_scope"
        case tags = "tags"
        case admin_graphql_api_id = "admin_graphql_api_id"
        case variants = "variants"
        case options = "options"
        case images = "images"
        case image = "image"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        body_html = try values.decodeIfPresent(String.self, forKey: .body_html)
        vendor = try values.decodeIfPresent(String.self, forKey: .vendor)
        product_type = try values.decodeIfPresent(String.self, forKey: .product_type)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        handle = try values.decodeIfPresent(String.self, forKey: .handle)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        published_at = try values.decodeIfPresent(String.self, forKey: .published_at)
        template_suffix = try values.decodeIfPresent(String.self, forKey: .template_suffix)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        published_scope = try values.decodeIfPresent(String.self, forKey: .published_scope)
        tags = try values.decodeIfPresent(String.self, forKey: .tags)
        admin_graphql_api_id = try values.decodeIfPresent(String.self, forKey: .admin_graphql_api_id)
        variants = try values.decodeIfPresent([VariantsProduct].self, forKey: .variants)
        options = try values.decodeIfPresent([OptionsProduct].self, forKey: .options)
        images = try values.decodeIfPresent([ImagesProduct].self, forKey: .images)
        image = try values.decodeIfPresent(Image.self, forKey: .image)
    }

}
struct VariantsProduct : Codable {
    let id : Int?
    let product_id : Int?
    let title : String?
    let price : String?
    let sku : String?
    let position : Int?
    let inventory_policy : String?
    let compare_at_price : String?
    let fulfillment_service : String?
    let inventory_management : String?
    let option1 : String?
    let option2 : String?
    let option3 : String?
    let created_at : String?
    let updated_at : String?
    let taxable : Bool?
    let barcode : String?
    let grams : Int?
    let image_id : String?
    let weight : Int?
    let weight_unit : String?
    let inventory_item_id : Int?
    let inventory_quantity : Int?
    let old_inventory_quantity : Int?
    let requires_shipping : Bool?
    let admin_graphql_api_id : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case product_id = "product_id"
        case title = "title"
        case price = "price"
        case sku = "sku"
        case position = "position"
        case inventory_policy = "inventory_policy"
        case compare_at_price = "compare_at_price"
        case fulfillment_service = "fulfillment_service"
        case inventory_management = "inventory_management"
        case option1 = "option1"
        case option2 = "option2"
        case option3 = "option3"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case taxable = "taxable"
        case barcode = "barcode"
        case grams = "grams"
        case image_id = "image_id"
        case weight = "weight"
        case weight_unit = "weight_unit"
        case inventory_item_id = "inventory_item_id"
        case inventory_quantity = "inventory_quantity"
        case old_inventory_quantity = "old_inventory_quantity"
        case requires_shipping = "requires_shipping"
        case admin_graphql_api_id = "admin_graphql_api_id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        product_id = try values.decodeIfPresent(Int.self, forKey: .product_id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        price = try values.decodeIfPresent(String.self, forKey: .price)
        sku = try values.decodeIfPresent(String.self, forKey: .sku)
        position = try values.decodeIfPresent(Int.self, forKey: .position)
        inventory_policy = try values.decodeIfPresent(String.self, forKey: .inventory_policy)
        compare_at_price = try values.decodeIfPresent(String.self, forKey: .compare_at_price)
        fulfillment_service = try values.decodeIfPresent(String.self, forKey: .fulfillment_service)
        inventory_management = try values.decodeIfPresent(String.self, forKey: .inventory_management)
        option1 = try values.decodeIfPresent(String.self, forKey: .option1)
        option2 = try values.decodeIfPresent(String.self, forKey: .option2)
        option3 = try values.decodeIfPresent(String.self, forKey: .option3)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        taxable = try values.decodeIfPresent(Bool.self, forKey: .taxable)
        barcode = try values.decodeIfPresent(String.self, forKey: .barcode)
        grams = try values.decodeIfPresent(Int.self, forKey: .grams)
        image_id = try values.decodeIfPresent(String.self, forKey: .image_id)
        weight = try values.decodeIfPresent(Int.self, forKey: .weight)
        weight_unit = try values.decodeIfPresent(String.self, forKey: .weight_unit)
        inventory_item_id = try values.decodeIfPresent(Int.self, forKey: .inventory_item_id)
        inventory_quantity = try values.decodeIfPresent(Int.self, forKey: .inventory_quantity)
        old_inventory_quantity = try values.decodeIfPresent(Int.self, forKey: .old_inventory_quantity)
        requires_shipping = try values.decodeIfPresent(Bool.self, forKey: .requires_shipping)
        admin_graphql_api_id = try values.decodeIfPresent(String.self, forKey: .admin_graphql_api_id)
    }

}
struct OptionsProduct : Codable {
    let id : Int?
    let product_id : Int?
    let name : String?
    let position : Int?
    let valuesOption : [String]?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case product_id = "product_id"
        case name = "name"
        case position = "position"
        case valuesOption = "values"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        product_id = try values.decodeIfPresent(Int.self, forKey: .product_id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        position = try values.decodeIfPresent(Int.self, forKey: .position)
        valuesOption = try values.decodeIfPresent([String].self, forKey: .valuesOption)
    }

}
struct ImageProduct : Codable {
    let id : Int?
    let product_id : Int?
    let position : Int?
    let created_at : String?
    let updated_at : String?
    let alt : String?
    let width : Int?
    let height : Int?
    let src : String?
    let variant_ids : [String]?
    let admin_graphql_api_id : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case product_id = "product_id"
        case position = "position"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case alt = "alt"
        case width = "width"
        case height = "height"
        case src = "src"
        case variant_ids = "variant_ids"
        case admin_graphql_api_id = "admin_graphql_api_id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        product_id = try values.decodeIfPresent(Int.self, forKey: .product_id)
        position = try values.decodeIfPresent(Int.self, forKey: .position)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        alt = try values.decodeIfPresent(String.self, forKey: .alt)
        width = try values.decodeIfPresent(Int.self, forKey: .width)
        height = try values.decodeIfPresent(Int.self, forKey: .height)
        src = try values.decodeIfPresent(String.self, forKey: .src)
        variant_ids = try values.decodeIfPresent([String].self, forKey: .variant_ids)
        admin_graphql_api_id = try values.decodeIfPresent(String.self, forKey: .admin_graphql_api_id)
    }

}
struct ImagesProduct : Codable {
    let id : Int?
    let product_id : Int?
    let position : Int?
    let created_at : String?
    let updated_at : String?
    let alt : String?
    let width : Int?
    let height : Int?
    let src : String?
    let variant_ids : [String]?
    let admin_graphql_api_id : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case product_id = "product_id"
        case position = "position"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case alt = "alt"
        case width = "width"
        case height = "height"
        case src = "src"
        case variant_ids = "variant_ids"
        case admin_graphql_api_id = "admin_graphql_api_id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        product_id = try values.decodeIfPresent(Int.self, forKey: .product_id)
        position = try values.decodeIfPresent(Int.self, forKey: .position)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        alt = try values.decodeIfPresent(String.self, forKey: .alt)
        width = try values.decodeIfPresent(Int.self, forKey: .width)
        height = try values.decodeIfPresent(Int.self, forKey: .height)
        src = try values.decodeIfPresent(String.self, forKey: .src)
        variant_ids = try values.decodeIfPresent([String].self, forKey: .variant_ids)
        admin_graphql_api_id = try values.decodeIfPresent(String.self, forKey: .admin_graphql_api_id)
    }

}
