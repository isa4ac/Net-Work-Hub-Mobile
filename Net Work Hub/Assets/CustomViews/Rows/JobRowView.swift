//
//  JobRowView.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/9/23.
//

import SwiftUI

struct JobRowView: View {
    var job: Job
    var body: some View {
        HStack {
            // Status Icon
            Image(systemName: getStatusIcon(job: job))
                .foregroundStyle(getStatusIconColor(job: job))
            
            VStack(alignment: .leading) {
                Text(job.jobDetail_Title ?? "")
                Text((job.define_Job_Status_Name ?? "").capitalized)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

func getStatusIcon(job: Job) -> String {
    switch((job.define_Job_Status_Name ?? "")) {
    case "Closed":
        return "checkmark.circle.fill"
    case "Open for Bids":
        return "arrow.down.forward.and.arrow.up.backward.circle.fill"
    case "Work In Progress":
        return "minus.circle.fill"
    case "Action Needed From Business":
        return "exclamationmark.circle.fill"
    default:
        return String()
    }
}

func getStatusIconColor(job: Job) -> Color {
    switch((job.define_Job_Status_Name ?? "")) {
    case "Closed":
        return .green
    case "Open for Bids":
        return .yellow
    case "Work In Progress":
        return .yellow
    case "Action Needed From Business":
        return .red
    default:
        return .clear
    }
}
