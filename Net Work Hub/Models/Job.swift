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
}
