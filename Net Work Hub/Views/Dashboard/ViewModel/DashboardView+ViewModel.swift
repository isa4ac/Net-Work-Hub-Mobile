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
        @Published var showConfirmation = false
        @Published var showWarning = false
        @Published var alert = Alert(title: Text(""))
        @Published var deleteJobID = String()
        
        func setDeleteAlert() {
            alert = Alert(title: Text("You cannot delete the job since it has already been agreed apon."),
                          dismissButton: .cancel())
        }
    }
}
