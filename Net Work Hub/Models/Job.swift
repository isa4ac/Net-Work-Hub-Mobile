//
//  Job.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/9/23.
//

import Foundation

class Job: Codable, ObservableObject, Equatable {
    enum CodingKeys: String, CodingKey {
        case id = "jobDetail_Id_PK"
        case title = "jobDetail_Title"
        case engID = "jobDetail_Engineer_UserId_FK"
        case status = "define_Job_Status_Name"
        case postDate = "jobDetail_Posted_DT"
        case details = "jobDetail_Description"
        case targetBudget = "jobDetail_Proposal_Target_Budget"
        case targetDate = "jobDetail_Proposal_Target_Date"
        case agreedBudget = "jobDetail_Proposal_Agreed_Budget"
        case agreedDate = "jobDetail_Proposal_Agreed_Date"
        case finalBudget = "jobDetail_Proposal_Final_Budget"
        case finalDate = "jobDetail_Proposal_Final_Date"
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
    
    public func dateToString(_ date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM, yyyy"
        
        return dateFormatter.string(from: date)
    }
    
    public func stringToDate(_ string: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM, yyyy"
        
        return dateFormatter.date(from: string) ?? Date()
    }
    
    required init(from decoder: Decoder) throws {
        let contianer = try decoder.container(keyedBy: CodingKeys.self)
        id = try contianer.decode(String.self, forKey: .id)
        engID = try contianer.decode(String.self, forKey: .engID)
        status = try contianer.decode(String.self, forKey: .status)
        postDate = try contianer.decode(String.self, forKey: .postDate)
        title = try contianer.decode(String.self, forKey: .title)
        details = try contianer.decode(String.self, forKey: .details)
        targetBudget = try contianer.decode(String.self, forKey: .targetBudget)
        targetDate = try contianer.decode(String.self, forKey: .targetDate)
        agreedBudget = try contianer.decode(String.self, forKey: .agreedBudget)
        agreedDate = try contianer.decode(String.self, forKey: .agreedDate)
        finalBudget = try contianer.decode(String.self, forKey: .finalBudget)
        finalDate = try contianer.decode(String.self, forKey: .finalDate)
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
