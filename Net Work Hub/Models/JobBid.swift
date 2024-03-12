//
//  JobBid.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 2/7/24.
//

import Foundation

class JobBid: Codable, Equatable {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case engId = "engineerId"
        case jobId = "jobId"
        case postDate = "postDate"
        case propFromEng = "propFromEng"
        case propAmount = "propAmount"
        case jobsDone = "jobsDone"
        case avgReview = "avgReview"
        case experience = "experience"
        case firstName = "firstName"
        case lastName = "lastName"
        case bio = "bio"
    }
    
    var id: String
    var engId: String
    var jobId: String
    var postDate: String?
    var propFromEng: String?
    var propAmount: Double?
    var jobsDone: Int?
    var avgReview: Double?
    var experience: Double?
    var firstName: String?
    var lastName: String?
    var bio: String?
    
    static func == (lhs: JobBid, rhs: JobBid) -> Bool {
        return lhs.id == rhs.id
    }
    
    required init(from decoder: Decoder) throws {
        let contianer = try decoder.container(keyedBy: CodingKeys.self)
        id = try contianer.decode(String.self, forKey: .id)
        engId = try contianer.decode(String.self, forKey: .engId)
        jobId = try contianer.decode(String.self, forKey: .jobId)
        postDate = try contianer.decode(String.self, forKey: .postDate)
        propFromEng = try contianer.decodeIfPresent(String.self, forKey: .propFromEng)
        propAmount = try contianer.decodeIfPresent(Double.self, forKey: .propAmount)
        jobsDone = try contianer.decodeIfPresent(Int.self, forKey: .jobsDone)
        avgReview = try contianer.decodeIfPresent(Double.self, forKey: .avgReview)
        experience = try contianer.decodeIfPresent(Double.self, forKey: .experience)
        firstName = try contianer.decodeIfPresent(String.self, forKey: .firstName)
        lastName = try contianer.decodeIfPresent(String.self, forKey: .lastName)
        bio = try contianer.decodeIfPresent(String.self, forKey: .bio)
    }
    
    init() {
        self.id = String()
        self.engId = String()
        self.jobId = String()
        self.postDate = String()
        self.propFromEng = String()
        self.propAmount = Double()
        self.jobsDone = Int()
        self.avgReview = Double()
        self.experience = Double()
        self.firstName = String()
        self.lastName = String()
        self.bio = String()
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(engId, forKey: .engId)
        try container.encode(jobId, forKey: .jobId)
        try container.encode(postDate, forKey: .postDate)
        try container.encode(propFromEng, forKey: .propFromEng)
        try container.encode(propAmount, forKey: .propAmount)
        try container.encode(jobsDone, forKey: .jobsDone)
        try container.encode(avgReview, forKey: .avgReview)
        try container.encode(experience, forKey: .experience)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(bio, forKey: .bio)
    }
}
