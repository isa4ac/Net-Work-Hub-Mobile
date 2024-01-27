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
                    ForEach(dataController.activeJobs.sorted(by: {
                        compairDate($0.targetDate ?? "", lessThan: $1.targetDate ?? "")
                    }), id: \.id) { job in
                        NavigationLink {
                            JobPreviewView(job: job)
                        } label: {
                            JobRowView(job: job)
                        }
                        .swipeActions(allowsFullSwipe: false) {
                            Button("Delete", role: .cancel) {
                                if job.status == "Open for Bids" {
                                    viewModel.deleteEditJobID = job.id
                                    viewModel.showConfirmation = true
                                } else {
                                    viewModel.setDeleteAlert()
                                    viewModel.showWarning = true
                                }
                            }
                            .tint(Color.red)
                            Button("Edit", role: .cancel) {
                                if job.status == "Open for Bids" {
                                    viewModel.editJob = job
                                    viewModel.showEditJob = true
                                } else {
                                    viewModel.setEditAlert()
                                    viewModel.showWarning = true
                                }
                            }
                            .tint(Color.blue)
                        }
                        .confirmationDialog(
                            Text("Are you sure you want to delete this job?"),
                            isPresented: $viewModel.showConfirmation,
                            titleVisibility: .visible
                        ) {
                            Button("Delete", role: .destructive) {
                                dataController.deleteUserJob(jobId: viewModel.deleteEditJobID, completion: { })
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
        .fullScreenCover(isPresented: $viewModel.showEditJob) {
            AddEditJobView(isPresented: $viewModel.showEditJob, isMainLoading: $viewModel.isLoading)
                .environmentObject(viewModel.editJob)
        }
    }
    
    func compairDate(_ date1: String, lessThan date2: String) -> Bool {
        var j = Job()
        return j.stringToDate(date1) < j.stringToDate(date2)
    }
}
