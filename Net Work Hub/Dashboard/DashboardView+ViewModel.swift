//
//  DashboardView+ViewModel.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/9/23.
//

import Foundation

extension DashboardView {
    class ViewModel: ObservableObject {
        @Published var showAddJob = false
        @Published var showUserProfile = false
        
        func addJob() {
    //        withAnimation {
    //            let newItem = Item(timestamp: Date())
    //            modelContext.insert(newItem)
    //        }
        }

        func deleteJobs(offsets: IndexSet) {
    //        withAnimation {
    //            for index in offsets {
    //                modelContext.delete(jobs[index])
    //            }
    //        }
        }
    }
}
