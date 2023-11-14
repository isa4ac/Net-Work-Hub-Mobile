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
        List {
            ForEach(viewModel.jobs, id: \.jobId) { job in
                NavigationLink {
                   // job detail page
                } label: {
                    JobRowView(job: job)
                }
            }
            .onDelete(perform: viewModel.deleteJobs)
            Button {
                // show add job screen
            } label: {
                HStack {
                    Spacer()
                    Text("Add Job")
                    Spacer()
                }
            }
        }
        .background(Color.clear)
    }
}
