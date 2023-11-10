//
//  Item.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/9/23.
//

import Foundation
import SwiftData

@Model
final class Job {
    var rid: Int
    var userId: Int
    var engineerId: Int
    var title: String
    var status: String
    var categoryId: Int
    var category: String
    var targetCost: Double
    var targetCompletion: Date
    var actualCost: Date
    var actualCompletion: Date
    var createDate: Date
    
    init(rid: Int, userId: Int, engineerId: Int, title: String, status: String, categoryId: Int, category: String, targetCost: Double, targetCompletion: Date, actualCost: Date, actualCompletion: Date, createDate: Date) {
        self.rid = rid
        self.userId = userId
        self.engineerId = engineerId
        self.title = title
        self.status = status
        self.categoryId = categoryId
        self.category = category
        self.targetCost = targetCost
        self.targetCompletion = targetCompletion
        self.actualCost = actualCost
        self.actualCompletion = actualCompletion
        self.createDate = createDate
    }
}
