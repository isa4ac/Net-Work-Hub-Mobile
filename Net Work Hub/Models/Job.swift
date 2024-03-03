//
//  Job.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/9/23.
//

import Foundation

class Job: Codable, ObservableObject, Equatable {
    enum CodingKeys: String, CodingKey {
        case id = "jobdetailIdPk"
        case title = "jobdetailTitle"
        case engID = "jobdetailEngineerUseridFk"
        case status = "jobdetailDefinedJobStatusFk"
        case postDate = "jobdetailPostedDt"
        case details = "jobdetailDescriptionFromBusiness"
        case targetBudget = "jobdetailProposalTargetBudget"
        case targetDate = "jobdetailProposalTargetDate"
        case agreedBudget = "jobdetailProposalAgreedBudget"
        case agreedDate = "jobdetailProposalAgreedDate"
        case finalBudget = "jobdetailProposalFinalBudget"
        case finalDate = "jobdetailProposalFinalDate"
    }
    
    static func == (lhs: Job, rhs: Job) -> Bool {
        return 
            lhs.id == rhs.id &&
            lhs.title == rhs.title &&
            lhs.details == rhs.details &&
            lhs.targetBudget == rhs.targetBudget &&
            lhs.targetDate == rhs.targetDate
    }
    
    @Published var id: String
    @Published var engID: String?
    @Published var status: String?
    @Published var postDate: String? // date
    @Published var title: String?
    @Published var details: String?
    @Published var targetBudget: String?
    @Published var targetDate: String?
    @Published var agreedBudget: String?
    @Published var agreedDate: String?
    @Published var finalBudget: String?
    @Published var finalDate: String?
    
    public func isOpen() -> Bool {
        return self.status?.lowercased() == "job-status-open"
    }
    
    public func prettyDateString(_ string: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        
        return dateToString(dateFormatter.date(from: string) ?? Date())
        
    }
    
    public func dateToString(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM, yyyy"
        
        return dateFormatter.string(from: date)
    }
    
    public func stringToDate(_ string: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        
        return dateFormatter.date(from: string) ?? Date()
    }
    
    required init(from decoder: Decoder) throws {
        let contianer = try decoder.container(keyedBy: CodingKeys.self)
        id = try contianer.decode(String.self, forKey: .id)
        engID = try contianer.decodeIfPresent(String.self, forKey: .engID)
        status = try contianer.decode(String.self, forKey: .status)
        postDate = try contianer.decode(String.self, forKey: .postDate)
        title = try contianer.decode(String.self, forKey: .title)
        details = try contianer.decode(String.self, forKey: .details)
        targetBudget = try contianer.decode(String.self, forKey: .targetBudget)
        targetDate = try contianer.decode(String.self, forKey: .targetDate)
        agreedBudget = try contianer.decodeIfPresent(String.self, forKey: .agreedBudget)
        agreedDate = try contianer.decodeIfPresent(String.self, forKey: .agreedDate)
        finalBudget = try contianer.decodeIfPresent(String.self, forKey: .finalBudget)
        finalDate = try contianer.decodeIfPresent(String.self, forKey: .finalDate)
    }
    
    init() {
        self.id = String()
        self.engID = String()
        self.status = String()
        self.postDate = String()
        self.title = String()
        self.details = String()
        self.targetBudget = String()
        self.targetDate = String()
        self.agreedBudget = String()
        self.agreedDate = String()
        self.finalBudget = String()
        self.finalDate = String()
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(engID, forKey: .engID)
        try container.encode(status, forKey: .status)
        try container.encode(postDate, forKey: .postDate)
        try container.encode(title, forKey: .title)
        try container.encode(details, forKey: .details)
        try container.encode(targetBudget, forKey: .targetBudget)
        try container.encode(targetDate, forKey: .targetDate)
        try container.encode(agreedBudget, forKey: .agreedBudget)
        try container.encode(agreedDate, forKey: .agreedDate)
        try container.encode(finalBudget, forKey: .finalBudget)
        try container.encode(finalDate, forKey: .finalDate)
    }
}
