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
        @Published var targetDate = Date()
        @Published var targetBudget = String()
        @Published var showAlert = false
        @Published var errorMessage = String()
        @Published var preEditJob = Job()
        
        func saveJob(_ job: Job) {
            preEditJob = job
        }
        
        func wasEditted(_ job: Job) -> Bool {
            if job == preEditJob {
                return false
            }
            return true
        }
        
        func loadValues(_ job: Job) {
            targetDate = job.stringToDate(job.targetDate ?? "")
            targetBudget = job.targetBudget ?? ""
        }
        
        func saveValues(_ job: Job) {
            job.targetDate = job.dateToString(targetDate)
            let numbers = "01234567890"
            job.targetBudget = targetBudget.filter { numbers.contains($0) }
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
                showAlert.toggle()
                return
            }
            
            // save target date and target budget
            saveValues(job)
            
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
