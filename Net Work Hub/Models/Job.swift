//
//  Job.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/9/23.
//

import Foundation

extension Job: Identifiable {
    var id: String { return jobId }
}

struct Job: Codable {
    var jobId: String
    var userId: String?
    var engineerId: String?
    var status: String?
    var posted: String? // date
    var title: String?
    var description: String?
    var targetBudget: String?
    var targetDate: String?
    var acceptedBudget: String?
    var acceptedDate: String?
    var actualBudget: String?
    var actualDate: String?
//    var acceptedByBusiness: String? // bool
//    var acceptedByBusinessDate: String? // date
//    var acceptedByEngineer: String? // bool
//    var acceptedByEngineerDate: String? // date
//    var finishedByBusiness: String // bool
//    var finishedByBusinessDate: String? // date
//    var finishedByEngineer: String? // bool
//    var finishedByEngineerDate: String? // date
    var notes: String?
}
