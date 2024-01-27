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
        @Published var showAddJob = false
        @Published var showEditJob = false
        @Published var showUserProfile = false
        @Published var showConfirmation = false
        @Published var showWarning = false
        @Published var alert = Alert(title: Text(""))
        @Published var deleteEditJobID = String()
        @Published var editJob = Job()
        
        
        func setDeleteAlert() {
            alert = Alert(title: Text("You cannot delete this job since it has already been agreed apon."),
                          dismissButton: .cancel())
        }
        
        func setEditAlert() {
            alert = Alert(title: Text("You cannot edit this job since it has already been agreed apon."),
                          dismissButton: .cancel())
        }
    }
}
