//
//  ThermostatEco.swift
//  Google Nest
//
//  Created by Muhammad Mudassar Yasin on 06/09/2022.
//

import Foundation

struct SdmDevicesTraitsThermostatEco : Codable {

    let availableModes : [String]?
    let coolCelsius : Double?
    let heatCelsius : Double?
    let mode : String?


    enum CodingKeys: String, CodingKey {
        case availableModes = "availableModes"
        case coolCelsius = "coolCelsius"
        case heatCelsius = "heatCelsius"
        case mode = "mode"
    }
    
    init() {
        availableModes = []
        coolCelsius = 0.0
        heatCelsius = 0.0
        mode = ""
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        availableModes = try values.decodeIfPresent([String].self, forKey: .availableModes)
        coolCelsius = try values.decodeIfPresent(Double.self, forKey: .coolCelsius)
        heatCelsius = try values.decodeIfPresent(Double.self, forKey: .heatCelsius)
        mode = try values.decodeIfPresent(String.self, forKey: .mode)
    }


}
