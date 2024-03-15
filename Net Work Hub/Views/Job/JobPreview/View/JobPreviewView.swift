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
    @State var showEditView = false
    @State var isLoading = false
    @State var showBids = false
    @State var showEngineerProf = false
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
                    NWHRow(label: "Target Delivery", detailText: job.prettyDateString(job.targetDate ?? ""))
                    NWHRow(label: "Status", detailText: getStatusString(job: job), detailIcon: getStatusIcon(job: job), detailIconColor: getStatusIconColor(job: job))
                }
                Section("Description") {
                    Text(job.details ?? "")
                        .multilineTextAlignment(.leading)
                }
                if job.isOpen() {
                    Section {
                        PrimaryButton(text: "Current Bids", action: {
                            showBids.toggle()
                        })
                    }
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                } else {
                    Section {
                        PrimaryButton(text: "Assigned Engineer", action: {
                            showEngineerProf.toggle()
                        })
                    }
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                }
            }
            .navigationTitle("Post Details")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                // only show delete/edit options if it has not been accepted
                if job.isOpen() {
                    ToolbarItem(placement: .bottomBar) {
                        Button("Delete") {
                            dataController.deleteUserJob(jobId: job.id, completion: {
                                DispatchQueue.main.async {
                                    dismiss()
                                }
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
            .navigationDestination(isPresented: $showBids) {
                JobBiddersView(jobId: job.id)
            }
            .navigationDestination(isPresented: $showEngineerProf) {
                UserProfileView(engineerId: job.engID ?? "")
            }
        }
    }
}

