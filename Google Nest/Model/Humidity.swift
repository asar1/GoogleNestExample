//
//  Humidity.swift
//  Google Nest
//
//  Created by Muhammad Mudassar Yasin on 06/09/2022.
//

import Foundation

struct SdmDevicesTraitsHumidity : Codable {

    let ambientHumidityPercent : Int?


    enum CodingKeys: String, CodingKey {
        case ambientHumidityPercent = "ambientHumidityPercent"
    }
    
    init() {
        ambientHumidityPercent = 0
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        ambientHumidityPercent = try values.decodeIfPresent(Int.self, forKey: .ambientHumidityPercent)
    }


}
