//
//  ThermostatMode.swift
//  Google Nest
//
//  Created by Muhammad Mudassar Yasin on 06/09/2022.
//

import Foundation

struct SdmDevicesTraitsThermostatMode : Codable {

    let availableModes : [String]?
    let mode : String?


    enum CodingKeys: String, CodingKey {
        case availableModes = "availableModes"
        case mode = "mode"
    }
    
    init() {
        availableModes = []
        mode = ""
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        availableModes = try values.decodeIfPresent([String].self, forKey: .availableModes)
        mode = try values.decodeIfPresent(String.self, forKey: .mode)
    }


}
