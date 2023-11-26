//
//  JobPreviewView.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/25/23.
//

import SwiftUI

struct JobPreviewView: View {
    var job: Job
    var body: some View {
        List {
            Section {
    //            NWHRow(label: "Category")
                NWHRow(label: "Target Budget", detailText: job.jobDetail_Proposal_Target_Budget ?? "")
                NWHRow(label: "Status", detailText: job.define_Job_Status_Name ?? "")
                NWHRow(label: "Engineer", detailText: "Hard Coded Engineer")
            }
            Section("Description") {
                NWHRow(label: "Job description. Job description. Job description. Job description. Job description. Job description. Job description. Job description. Job description. ")
                    .multilineTextAlignment(.leading)
            }
        }
        .navigationTitle(job.jobDetail_Title ?? "")
    }
}
