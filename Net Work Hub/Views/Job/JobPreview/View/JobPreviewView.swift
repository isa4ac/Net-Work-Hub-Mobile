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
    var job: Job
    var body: some View {
        List {
            Section {
                NWHRow(label: "Job Title", detailText: job.jobDetail_Title ?? "")
    //            NWHRow(label: "Category")
                NWHRow(label: "Target Budget", detailText: job.jobDetail_Proposal_Target_Budget?.currencyFormatting() ?? "")
                NWHRow(label: "Target Delivery", detailText: job.jobDetail_Proposal_Target_Date ?? "")
                NWHRow(label: "Status", detailText: job.define_Job_Status_Name ?? "", detailIcon: getStatusIcon(job: job), detailIconColor: getStatusIconColor(job: job))
                NWHRow(label: "Engineer", detailText: "Link to Engineer Profile")
            }
            Section("Description") {
                Text(job.jobDetail_Description ?? "")
                    .multilineTextAlignment(.leading)
            }
        }
        .navigationTitle("Post Details")
        .navigationBarTitleDisplayMode(.automatic)
        .toolbar {
            // only show delete/edit options if there it has not been accepted
            if job.define_Job_Status_Name?.lowercased() == "open for bids" {
                ToolbarItem(placement: .bottomBar) {
                    Button("Delete") {
                        dataController.deleteUserJob(jobId: job.jobDetail_Id_PK, completion: {
                            dismiss()
                        })
                    }
                    .foregroundStyle(.red)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Edit") {
                        // open edit page here
                    }
                }
            }
        }
    }
    
    func getDateString(_ date: Date) -> String {
        let format = DateFormatter()
        format.dateFormat = "E, d MMM"
        return format.string(from: date)
    }
}
