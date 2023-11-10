//
//  DashboardView+ViewModel.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/9/23.
//

import Foundation

extension ContentView {
    class ViewModel: ObservableObject {
        @Published var showAddJob = false
        @Published var showUserProfile = false
    }
}
