//
//  JobPreviewView.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/25/23.
//

import SwiftUI

struct JobPreviewView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var dataController: DataController
    @StateObject var job = Job()
//    @StateObject var job = Job()
    @State var showEditView = false
    @State var isLoading = false
    var body: some View {
        if isLoading {
            ProgressView()
                .onFirstAppear {
                    dataController.getUserJobs(completion: {
                        isLoading = false
                    })
                }
        } else {
            List {
                Section {
                    NWHRow(label: "Job Title", detailText: job.title ?? "")
                    //            NWHRow(label: "Category")
                    NWHRow(label: "Target Budget", detailText: job.targetBudget?.currencyFormatting() ?? "")
                    NWHRow(label: "Target Delivery", detailText: job.targetDate ?? "")
                    NWHRow(label: "Status", detailText: job.status ?? "", detailIcon: getStatusIcon(job: job), detailIconColor: getStatusIconColor(job: job))
                    NWHRow(label: "Engineer", detailText: "Link to Engineer Profile")
                }
                Section("Description") {
                    Text(job.details ?? "")
                        .multilineTextAlignment(.leading)
                }
            }
            .navigationTitle("Post Details")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                // only show delete/edit options if there it has not been accepted
                if job.status?.lowercased() == "open for bids" {
                    ToolbarItem(placement: .bottomBar) {
                        Button("Delete") {
                            dataController.deleteUserJob(jobId: job.id, completion: {
                                dismiss()
                            })
                        }
                        .foregroundStyle(.red)
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Edit") {
                            showEditView.toggle()
                        }
                    }
                }
            }
            .fullScreenCover(isPresented: $showEditView) {
                AddEditJobView(isPresented: $showEditView, isMainLoading: $isLoading)
                    .environmentObject(job)
            }
        }
    }
}
