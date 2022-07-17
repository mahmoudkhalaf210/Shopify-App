//
//  Categor.swift
//  Shopify
//
//  Created by Ahmed on 09/07/2022.
//

import Foundation
/*
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Json4Swift_Base : Codable {
    let custom_collections : [Custom_collections]?

    enum CodingKeys: String, CodingKey {

        case custom_collections = "custom_collections"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        custom_collections = try values.decodeIfPresent([Custom_collections].self, forKey: .custom_collections)
    }

}
struct Custom_collections : Codable {
    let id : Int?
    let handle : String?
    let title : String?
    let updated_at : String?
    let body_html : String?
    let published_at : String?
    let sort_order : String?
    let template_suffix : String?
    let published_scope : String?
    let admin_graphql_api_id : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case handle = "handle"
        case title = "title"
        case updated_at = "updated_at"
        case body_html = "body_html"
        case published_at = "published_at"
        case sort_order = "sort_order"
        case template_suffix = "template_suffix"
        case published_scope = "published_scope"
        case admin_graphql_api_id = "admin_graphql_api_id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        handle = try values.decodeIfPresent(String.self, forKey: .handle)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        body_html = try values.decodeIfPresent(String.self, forKey: .body_html)
        published_at = try values.decodeIfPresent(String.self, forKey: .published_at)
        sort_order = try values.decodeIfPresent(String.self, forKey: .sort_order)
        template_suffix = try values.decodeIfPresent(String.self, forKey: .template_suffix)
        published_scope = try values.decodeIfPresent(String.self, forKey: .published_scope)
        admin_graphql_api_id = try values.decodeIfPresent(String.self, forKey: .admin_graphql_api_id)
    }

}
