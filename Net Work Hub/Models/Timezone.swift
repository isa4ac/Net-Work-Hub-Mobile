//
//  Timezone.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 3/16/24.
//

import Foundation

struct Timezone: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "defineTimezoneIdPk"
        case region = "defineTimezoneNameRegion"
        case namePhp = "defineTimezoneNamePhp"
        case sortVal = "defineTimezoneSort"
    }
    
    var id: String
    var region: String
    var namePhp: String
    var sortVal: Int
}
