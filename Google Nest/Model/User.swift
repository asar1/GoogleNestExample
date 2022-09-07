//
//  User.swift
//  Google Nest
//
//  Created by Muhammad Asar on 2/27/22.
//

import Foundation
import GoogleSignIn


struct GoogleNest : Codable {

    let devices : [Device]?


    enum CodingKeys: String, CodingKey {
        case devices = "devices"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        devices = try values.decodeIfPresent([Device].self, forKey: .devices)
    }


}
