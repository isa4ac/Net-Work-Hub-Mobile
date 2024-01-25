//
//  AddEditJobView+ViewModel.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/20/23.
//

import Foundation

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
        
        private func dateToString(_ date: Date) -> String{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMM, yyyy"
            
            return dateFormatter.string(from: date)
        }
        
        private func stringToDate(_ string: String) -> Date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMM, yyyy"
            
            return dateFormatter.date(from: string) ?? Date()
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
        
        func getFormattedDateString(_ date: Date) -> String {
            let formatPost = DateFormatter()
            formatPost.dateFormat = "Y-m-d H:i:s"
            return formatPost.string(from: date)
        }
        
        func getNextWeek() -> Date {
            let calendar = Calendar.current
            return calendar.date(byAdding: .weekOfYear, value: 1, to: Date()) ?? Date()
        }
    }
}
