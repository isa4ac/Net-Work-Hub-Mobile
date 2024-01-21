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
        @Published var showAlert = false
        @Published var errorMessage = String()
        
        func loadTargetDate(_ job: Job) {
            targetDate = stringToDate(job.targetDate ?? "")
        }
        
        func saveTargetDate(_ job: Job) {
            
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
            if job.description == String() {
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
