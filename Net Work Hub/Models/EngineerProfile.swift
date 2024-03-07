//
//  EngineerProfile.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 3/7/24.
//

import Foundation

class EngineerProfile: Codable, Equatable {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case firstName = "firstName"
        case lastName = "lastName"
        case timeZone = "timeZone"
        case experienceStart = "experienceStart"
        case jobsDone = "jobsDone"
        case avgReview = "avgReview"
        case bio = "bio"
    }
    
    var id: String
    var firstName: String?
    var lastName: String?
    var timeZone: String?
    var experienceStart: String?
    var jobsDone: String?
    var avgReview: String?
    var bio: String?
    
    static func == (lhs: EngineerProfile, rhs: EngineerProfile) -> Bool {
        return lhs.id == rhs.id
    }
    
    required init(from decoder: Decoder) throws {
        let contianer = try decoder.container(keyedBy: CodingKeys.self)
        id = try contianer.decode(String.self, forKey: .id)
        firstName = try contianer.decode(String.self, forKey: .firstName)
        lastName = try contianer.decode(String.self, forKey: .lastName)
        timeZone = try contianer.decode(String.self, forKey: .timeZone)
        experienceStart = try contianer.decode(String.self, forKey: .experienceStart)
        jobsDone = try contianer.decode(String.self, forKey: .jobsDone)
        avgReview = try contianer.decode(String.self, forKey: .avgReview)
        bio = try contianer.decode(String.self, forKey: .bio)
    }
    
    init() {
        self.id = String()
        self.firstName = String()
        self.lastName = String()
        self.timeZone = String()
        self.experienceStart = String()
        self.jobsDone = String()
        self.avgReview = String()
        self.bio = String()
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .firstName)
        try container.encode(experienceStart, forKey: .experienceStart)
        try container.encode(jobsDone, forKey: .jobsDone)
        try container.encode(avgReview, forKey: .avgReview)
        try container.encode(bio, forKey: .bio)
    }
}
