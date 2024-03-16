//
//  AddEditJobView+ViewModel.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/20/23.
//

import Foundation
import SwiftUI

extension AddEditJobView {
    class ViewModel: ObservableObject {
        @Published var title = String()
        @Published var targetDate = Date()
        @Published var targetBudget = String()
        @Published var description = String()
        @Published var errorMessage = String()
        @Published var showExitAlert = false
        @Published var showValidationAlert = false
        
        func wasEditted(_ job: Job, _ isNew: Bool) -> Bool {
            if isNew { // don't check date if it is a new job
                if job.title == title &&
                    job.targetBudget == getTargetBudgetDouble() &&
                    job.details == description {
                    return false
                }
                return true
            } else {
                if job.title == title &&
                    job.targetDate == getTargetDateString(job) &&
                    job.targetBudget == getTargetBudgetDouble() &&
                    job.details == description {
                    return false
                }
                return true
            }
        }
        
        func getTargetDateString(_ job: Job) -> String {
            job.serverFormatDateString(from: job.dateToString(targetDate))
        }
        
        func getTargetBudgetDouble() -> Double {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency

            if let number = formatter.number(from: targetBudget) {
                return Double(number.doubleValue)
            }
            return 0.0
        }
        
        func loadValues(_ job: Job) {
            title = job.title ?? ""
            targetDate = job.stringToDate(job.targetDate ?? "")
            if job.targetDate == nil || job.targetBudget == 0.00 {
                targetBudget = ""
            } else {
                targetBudget = String(format: "$%.2f", job.targetBudget ?? 0.00)
            }
            description = job.details ?? ""
        }
        
        func controlsValid(_ job: Job) -> Bool {
            if job.title == String() {
                errorMessage = "Please Enter Post Title"
                return false
            }
            if job.details == String() {
                errorMessage = "Please Enter a Thoughful Description"
                return false
            }
            return true
        }
        
        func addJob(_ job: Job, isNew: Bool, completion: @escaping () -> (), _ dataController: DataController) {
            if !controlsValid(job) {
                showValidationAlert = true
                showValidationAlert.toggle()
                return
            }
            
            job.title = title
            job.targetBudget = getTargetBudgetDouble()
            job.targetDate = getTargetDateString(job)
            job.details = description
            
            if isNew {
                dataController.addUserJob(job, completion: { completion() })
            } else {
                dataController.updateUserJob(job, completion: { completion() })
            }
        }
        
        func getNextWeek() -> Date {
            let calendar = Calendar.current
            return calendar.date(byAdding: .weekOfYear, value: 1, to: Date()) ?? Date()
        }
    }
}
