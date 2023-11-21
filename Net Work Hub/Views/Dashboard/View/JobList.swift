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
                ForEach(viewModel.jobs, id: \.jobId) { job in
                    JobRowView(job: job)
//                    NavigationLink {
//                        // job detail page
//                    } label: {
//                        JobRowView(job: job)
//                    }
                }
                .onDelete(perform: viewModel.deleteJobs)
                PrimaryButton(text: "Add Job", action: {
                    viewModel.showAddJob = true
                })
                .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
        }
        .navigationDestination(for: Job.self) { job in
            // job detial
        }
        .navigationDestination(isPresented: $viewModel.showAddJob) {
            AddJobView()
        }
    }
}
