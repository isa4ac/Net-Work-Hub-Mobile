//
//  AddJobView+ViewModel.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/20/23.
//

import Foundation

extension AddJobView {
    class ViewModel: ObservableObject {
        @Published var jobTitle = String()
        @Published var jobDescription = String()
//        @Published var category = String() // TO-DO: Not in database yet
        @Published var targetBudget = String()
        @Published var targetDate = Date()
        @Published var showAlert = false
        @Published var errorMessage = String()
        
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
            Job(jobDetail_Id_PK: "",
                jobDetail_Title: jobTitle,
                jobDetail_Description: jobDescription,
                jobDetail_Proposal_Target_Budget: targetBudget,
                jobDetail_Proposal_Target_Date: getFormattedDateString(targetDate))
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
