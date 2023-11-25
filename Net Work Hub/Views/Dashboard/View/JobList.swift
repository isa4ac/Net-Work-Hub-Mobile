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
                    ForEach(dataController.activeJobs, id: \.jobDetail_Id_PK) { job in
                        NavigationLink {
                            JobPreviewView()
                        } label: {
                            JobRowView(job: job)
                        }
                    }
                    // TODO: MAKE onDelete FUNCTION ONCE DELETE JOB SERVICE IS IMPLEMENTED
                    //                .onDelete(perform: viewModel.deleteJobs)
                }
                Section {
                    PrimaryButton(text: "Add Job", action: {
                        viewModel.showAddJob = true
                    })
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                }
            }
        }
        .navigationDestination(for: Job.self) { job in
            // job detial
        }
        .navigationDestination(isPresented: $viewModel.showAddJob) {
            AddJobView(isPresented: $viewModel.showAddJob, isMainLoading: $viewModel.isLoading)
//                .environmentObject(dataController)
        }
    }
}
