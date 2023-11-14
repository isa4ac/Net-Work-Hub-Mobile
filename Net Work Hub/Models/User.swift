//
//  User.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/14/23.
//

import Foundation

struct User: Codable {
    var id: String?
    var timeZone: String?
    var email: String?
    var preferredName: String?
    var firstName: String?
    var lastName: String?
    var businessName: String?
    var profileDescription: String?
}
