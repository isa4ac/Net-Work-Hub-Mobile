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
    //            NWHRow(label: "Category")
                NWHRow(label: "Target Budget", detailText: job.jobDetail_Proposal_Target_Budget?.currencyFormatting() ?? "")
                NWHRow(label: "Target Delivery", detailText: job.jobDetail_Proposal_Target_Date ?? "")
                NWHRow(label: "Status", detailText: job.define_Job_Status_Name ?? "")
                NWHRow(label: "Engineer", detailText: "Link to Engineer Profile")
            }
            Section("Description") {
                Text(job.jobDetail_Description ?? "")
                    .multilineTextAlignment(.leading)
            }
        }
        .navigationTitle(job.jobDetail_Title ?? "")
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button("Delete") {
                    dataController.deleteUserJob(jobId: job.jobDetail_Id_PK, completion: {
                        dismiss()
                    })
                }
                .foregroundStyle(.red)
            }
        }
    }
    
    func getDateString(_ date: Date) -> String {
        let format = DateFormatter()
        format.dateFormat = "E, d MMM"
        return format.string(from: date)
    }
}
