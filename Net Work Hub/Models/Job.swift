//
//  Job.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/9/23.
//

import Foundation

struct Job: Codable, Hashable {
    var jobDetail_Id_PK: String
    var jobDetail_Engineer_UserId_FK: String?
    var define_Job_Status_Name: String?
    var jobDetail_Posted_DT: String? // date
    var jobDetail_Title: String?
    var jobDetail_Description: String?
    var jobDetail_Proposal_Target_Budget: String?
    var jobDetail_Proposal_Target_Date: String?
    var jobDetail_Proposal_Agreed_Budget: String?
    var jobDetail_Proposal_Agreed_Date: String?
    var jobDetail_Proposal_Final_Budget: String?
    var jobDetail_Proposal_Final_Date: String?
//    var acceptedByBusiness: String? // bool
//    var acceptedByBusinessDate: String? // date
//    var acceptedByEngineer: String? // bool
//    var acceptedByEngineerDate: String? // date
    
    private func dateToString(_ date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM, yyyy"
        
        return dateFormatter.string(from: date)
    }
    
    init(_ jobDetail_Id_PK: String, _ jobDetail_Title: String, _ jobDetail_Description: String, _ jobDetail_Proposal_Target_Budget: String, _ jobDetail_Proposal_Target_Date: Date) {
        self.jobDetail_Id_PK = jobDetail_Id_PK
        jobDetail_Engineer_UserId_FK = String()
        define_Job_Status_Name = String()
        jobDetail_Posted_DT = String()
        self.jobDetail_Title = jobDetail_Title
        self.jobDetail_Description = jobDetail_Description
        self.jobDetail_Proposal_Target_Budget = jobDetail_Proposal_Target_Budget
        self.jobDetail_Proposal_Target_Date = dateToString(jobDetail_Proposal_Target_Date)
        jobDetail_Proposal_Agreed_Budget = String()
        jobDetail_Proposal_Agreed_Date = String()
        jobDetail_Proposal_Final_Budget = String()
        jobDetail_Proposal_Final_Date = String()
    }
    
    init() {
        jobDetail_Id_PK = String()
        jobDetail_Engineer_UserId_FK = String()
        define_Job_Status_Name = String()
        jobDetail_Posted_DT = String()
        jobDetail_Title = String()
        jobDetail_Description = String()
        jobDetail_Proposal_Target_Budget = String()
        jobDetail_Proposal_Target_Date = String()
        jobDetail_Proposal_Agreed_Budget = String()
        jobDetail_Proposal_Agreed_Date = String()
        jobDetail_Proposal_Final_Budget = String()
        jobDetail_Proposal_Final_Date = String()
    }
}
