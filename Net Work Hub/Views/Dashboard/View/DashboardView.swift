//
//  DashboardView.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/9/23.
//

import SwiftUI

struct DashboardView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        NavigationStack {
            jobList
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        UserProfileView()
                    } label: {
                        Label("Your Profile", systemImage: "person.circle.fill")
                    }
                }
            }
            .navigationTitle("Dashboard")
        }
    }
}
