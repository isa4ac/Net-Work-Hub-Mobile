//
//  JobList.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/14/23.
//

import Foundation
import SwiftUI

extension DashboardView {
    var jobList: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(dataController.activeJobs, id: \.id) { job in
                        NavigationLink {
                            JobPreviewView(job: job)
                        } label: {
                            JobRowView(job: job)
                        }
                        .swipeActions(allowsFullSwipe: false) {
                            Button("Delete", role: .cancel) {
                                if job.status == "Open for Bids" {
                                    viewModel.showConfirmation = true
                                } else {
                                    viewModel.setDeleteAlert()
                                    viewModel.showWarning = true
                                }
                            }
                            .tint(Color.red)
                        }
                        .confirmationDialog(
                            Text("Are you sure you want to delete this job?"),
                            isPresented: $viewModel.showConfirmation,
                            titleVisibility: .visible
                        ) {
                            Button("Delete", role: .destructive) {
                                dataController.deleteUserJob(jobId: job.id, completion: { })
                                viewModel.isLoading = true
                            }
                        }
                    }
                }
                Section {
                    PrimaryButton(text: "Add Job", action: {
                        viewModel.showAddJob = true
                    })
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                }
            }
            .listSectionSpacing(20)
        }
        .alert(isPresented: $viewModel.showWarning, content: { viewModel.alert })
        .navigationDestination(isPresented: $viewModel.showAddJob) {
            AddEditJobView(isPresented: $viewModel.showAddJob, isMainLoading: $viewModel.isLoading, isNewJob: true)
                .environmentObject(Job())
        }
    }
}
