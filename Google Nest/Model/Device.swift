//
//  Device.swift
//  Google Nest
//
//  Created by Muhammad Mudassar Yasin on 06/09/2022.
//

import Foundation

struct Device : Codable {

    let assignee : String?
    let name : String?
    let parentRelations : [ParentRelation]?
    let traits : Trait?
    let type : String?


    enum CodingKeys: String, CodingKey {
        case assignee = "assignee"
        case name = "name"
        case parentRelations = "parentRelations"
        case traits = "traits"
        case type = "type"
    }
    
    init() {
        assignee = ""
        name = ""
        parentRelations = [ParentRelation]()
        traits = Trait()
        type = ""
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        assignee = try values.decodeIfPresent(String.self, forKey: .assignee)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        parentRelations = try values.decodeIfPresent([ParentRelation].self, forKey: .parentRelations)
        traits = try values.decodeIfPresent(Trait.self, forKey: .traits)
        type = try values.decodeIfPresent(String.self, forKey: .type)
    }


}
