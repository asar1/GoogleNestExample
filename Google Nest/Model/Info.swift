//
//  Info.swift
//  Google Nest
//
//  Created by Muhammad Mudassar Yasin on 06/09/2022.
//

import Foundation

struct SdmDevicesTraitsInfo : Codable {

    let customName : String?


    enum CodingKeys: String, CodingKey {
        case customName = "customName"
    }
    
    init() {
        customName = ""
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        customName = try values.decodeIfPresent(String.self, forKey: .customName)
    }


}

