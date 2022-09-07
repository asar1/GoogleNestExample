//
//  Connectivity.swift
//  Google Nest
//
//  Created by Muhammad Mudassar Yasin on 06/09/2022.
//

import Foundation

struct SdmDevicesTraitsConnectivity : Codable {

    let status : String?


    enum CodingKeys: String, CodingKey {
        case status = "status"
    }
    
    init() {
        status = ""
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }


}
