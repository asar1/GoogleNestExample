//
//  Setting.swift
//  Google Nest
//
//  Created by Muhammad Mudassar Yasin on 06/09/2022.
//

import Foundation

struct SdmDevicesTraitsSetting : Codable {

    let temperatureScale : String?


    enum CodingKeys: String, CodingKey {
        case temperatureScale = "temperatureScale"
    }
    
    init() {
        temperatureScale = ""
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        temperatureScale = try values.decodeIfPresent(String.self, forKey: .temperatureScale)
    }


}
