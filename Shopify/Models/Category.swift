
//
//  Brands.swift
//  Shopify
//
//  Created by Ahmed on 04/07/2022.
//
import Foundation

// MARK: - Welcome
struct CustomCollectionsModels: Codable {
    let custom_collections: [Custom_collection]

    enum CodingKeys: String, CodingKey {
        case custom_collections = "custom_collections"
    }
}

// MARK: - CustomCollection
struct Custom_collection: Codable {
    let id: Int
    let handle, title: String?
    let updatedAt: Date
    let bodyHTML: String?
    let publishedAt: Date
    let sortOrder: String
   // let templateSuffix: JSONNull?
    let publishedScope, adminGraphqlAPIID: String
    let image: CategoryImage?

    enum CodingKeys: String, CodingKey {
        case id, handle, title
        case updatedAt = "updated_at"
        case bodyHTML = "body_html"
        case publishedAt = "published_at"
        case sortOrder = "sort_order"
       // case templateSuffix = "template_suffix"
        case publishedScope = "published_scope"
        case adminGraphqlAPIID = "admin_graphql_api_id"
        case image
    }
}

// MARK: - Image
struct CategoryImage: Codable {
    let createdAt: Date
   // let alt: JSONNull?
    let width, height: Int
    let src: String

    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case width, height, src
        //case alt
    }
}

// MARK: - Encode/decode helpers

//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
////    public var hashValue: Int {
////        return 0
////    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
