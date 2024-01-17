//
//  AddEditJobView+ViewModel.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/20/23.
//

import Foundation

extension AddEditJobView {
    class ViewModel: ObservableObject {
        @Published var jobTitle = String()
        @Published var jobDescription = String()
//        @Published var category = String() // TO-DO: Not in database yet
        @Published var targetBudget = String()
        @Published var targetDate = Date()
        @Published var showAlert = false
        @Published var errorMessage = String()
        
        func loadJob(_ job: Job) {
            jobTitle = job.jobDetail_Title ?? ""
            jobDescription = job.jobDetail_Description ?? ""
            targetBudget = job.jobDetail_Proposal_Target_Budget ?? ""
            targetDate = stringToDate(job.jobDetail_Proposal_Target_Date ?? "")
        }
        
        private func stringToDate(_ string: String) -> Date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMM, yyyy"
            
            return dateFormatter.date(from: string) ?? Date()
        }
        
        func controlsValid() -> Bool {
            if jobTitle == String() {
                errorMessage = "Please Enter Post Title"
                return false
            }
            if jobDescription == String() {
                errorMessage = "Please Enter a Thoughful Description"
                return false
            }
            return true
        }
        
        func generateJobObject() -> Job {
            Job("", jobTitle, jobDescription, targetBudget, targetDate)
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
