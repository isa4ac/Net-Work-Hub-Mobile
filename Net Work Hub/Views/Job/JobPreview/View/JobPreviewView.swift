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
                NWHRow(label: "Target Budget", detailText: job.jobDetail_Proposal_Target_Budget?.currencyFormatting() ?? "")
                NWHRow(label: "Target Delivery", detailText: job.jobDetail_Proposal_Target_Date ?? "")
                NWHRow(label: "Status", detailText: job.define_Job_Status_Name ?? "")
                NWHRow(label: "Engineer", detailText: "Hard Coded Engineer")
            }
            Section("Description") {
                Text("Job description gejnrgijne ejrn gie jnerkmevomervm vekrnnerkjgn n ekrm okemr me ome rfklme lekrmf m. erlkgmneokrnerg. erkgnergkdfkn vnelknpwoekps sp dokw pofwpeo fpok w[pef, mw. fwmepfo . wemwpeogm . ")
                    .multilineTextAlignment(.leading)
            }
        }
        .navigationTitle(job.jobDetail_Title ?? "")
    }
    
    func getDateString(_ date: Date) -> String {
        let format = DateFormatter()
        format.dateFormat = "E, d MMM"
        return format.string(from: date)
    }
}
