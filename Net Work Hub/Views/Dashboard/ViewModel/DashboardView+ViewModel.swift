//
//  DashboardView+ViewModel.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/9/23.
//

import SwiftUI

extension DashboardView {
    class ViewModel: ObservableObject {
        @Published var isLoading = true
        @Published var user = User()
        @Published var jobs = [Job]()
        @Published var showAddJob = false
        @Published var showUserProfile = false
        @Published var showAlert = false
        @Published var alert = Alert(title: Text(""))
        
        func setDeletePromptAlert(_ action: @escaping () -> ()) {
            alert = Alert(title: Text("Are you sure you want to delete this job post?"),
                  message: Text("This will also delete any bids on the job"),
                  primaryButton: .cancel(),
                  secondaryButton: .destructive(Text("Yes, Delete Job"), action: {
                action()
            }))
        }
        
        func setDeleteAlert() {
            alert = Alert(title: Text("Are you sure you want to delete this job post?"),
                          message: Text("This will also delete any bids on the job"),
                          dismissButton: .cancel())
        }
    }
}
