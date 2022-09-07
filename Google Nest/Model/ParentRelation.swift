//
//  ParentRelation.swift
//  Google Nest
//
//  Created by Muhammad Mudassar Yasin on 06/09/2022.
//

import Foundation

struct ParentRelation : Codable {

    let displayName : String?
    let parent : String?


    enum CodingKeys: String, CodingKey {
        case displayName = "displayName"
        case parent = "parent"
    }
    
    init() {
        displayName = ""
        parent = ""
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        displayName = try values.decodeIfPresent(String.self, forKey: .displayName)
        parent = try values.decodeIfPresent(String.self, forKey: .parent)
    }


}
