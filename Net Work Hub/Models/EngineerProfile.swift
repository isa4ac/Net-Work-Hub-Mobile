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
        case experience = "experience"
        case jobsDone = "jobsDone"
        case avgReview = "avgReview"
        case bio = "bio"
    }
    
    var id: String
    var firstName: String?
    var lastName: String?
    var timeZone: String?
    var experience: Double?
    var jobsDone: Int?
    var avgReview: Double?
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
        experience = try contianer.decode(Double.self, forKey: .experience)
        jobsDone = try contianer.decode(Int.self, forKey: .jobsDone)
        avgReview = try contianer.decode(Double.self, forKey: .avgReview)
        bio = try contianer.decode(String.self, forKey: .bio)
    }
    
    init() {
        self.id = String()
        self.firstName = String()
        self.lastName = String()
        self.timeZone = String()
        self.experience = Double()
        self.jobsDone = Int()
        self.avgReview = Double()
        self.bio = String()
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(experience, forKey: .experience)
        try container.encode(jobsDone, forKey: .jobsDone)
        try container.encode(avgReview, forKey: .avgReview)
        try container.encode(bio, forKey: .bio)
    }
}
