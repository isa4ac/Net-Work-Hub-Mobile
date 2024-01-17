//
//  DashboardView.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/9/23.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var dataController: DataController
    @StateObject var viewModel = ViewModel()
    var body: some View {
        if viewModel.isLoading {
            ProgressView()
                .onFirstAppear {
                    dataController.getUserJobs(completion: {
                        viewModel.isLoading = false
                    })
                }
        } else {
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
                    .refreshable {
                        viewModel.isLoading = true
                    }
            }
        }
    }
}
