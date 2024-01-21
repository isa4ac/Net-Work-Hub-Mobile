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
                    }
                    .onDelete(perform: { indexSet in
                        for index in indexSet {
                            if dataController.activeJobs[index].status == "Open for Bids" {
                                viewModel.setDeletePromptAlert {
                                    dataController.deleteUserJob(jobId: dataController.activeJobs[index].id, completion: {
                                        withAnimation {
                                            dataController.activeJobs.remove(atOffsets:  indexSet)
                                        }
                                    })
                                }
                            } else {
                                viewModel.setDeleteAlert()
                            }
                        }
                        viewModel.showAlert.toggle()
                    })
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
        .alert(isPresented: $viewModel.showAlert, content: { viewModel.alert })
        .navigationDestination(isPresented: $viewModel.showAddJob) {
            AddEditJobView(isPresented: $viewModel.showAddJob, isMainLoading: $viewModel.isLoading)
        }
    }
}
