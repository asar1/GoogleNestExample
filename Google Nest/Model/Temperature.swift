//
//  Temperature.swift
//  Google Nest
//
//  Created by Muhammad Mudassar Yasin on 06/09/2022.
//

import Foundation

struct SdmDevicesTraitsTemperature : Codable {

    let ambientTemperatureCelsius : Double?


    enum CodingKeys: String, CodingKey {
        case ambientTemperatureCelsius = "ambientTemperatureCelsius"
    }
    
    init() {
        ambientTemperatureCelsius = 0.0
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        ambientTemperatureCelsius = try values.decodeIfPresent(Double.self, forKey: .ambientTemperatureCelsius)
    }


}
