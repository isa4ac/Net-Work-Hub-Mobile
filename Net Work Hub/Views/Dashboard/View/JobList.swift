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
                    .onDelete(perform: { indexSet in
                        for index in indexSet {
                            dataController.deleteUserJob(jobId: dataController.activeJobs[index].jobDetail_Id_PK, completion: {
                                dataController.activeJobs.remove(atOffsets:  indexSet)
                            })
                        }
                    })
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
        }
    }
}
