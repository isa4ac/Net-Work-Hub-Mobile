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
                Text(job.title ?? "")
                Text((getStatusString(job: job)).capitalized)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

func getStatusIcon(job: Job) -> String {
    switch((job.status ?? "")) {
    case "job-status-closed":
        return "checkmark.circle.fill"
    case "job-status-open":
        return "arrow.down.forward.and.arrow.up.backward.circle.fill"
    case "job-status-in-progress":
        return "minus.circle.fill"
    case "job-status-action-needed":
        return "exclamationmark.circle.fill"
    default:
        return String()
    }
}

func getStatusIconColor(job: Job) -> Color {
    switch((job.status ?? "")) {
    case "job-status-closed":
        return .green
    case "job-status-open":
        return .yellow
    case "job-status-in-progress":
        return .yellow
    case "job-status-action-needed":
        return .red
    default:
        return .clear
    }
}

func getStatusString(job: Job) -> String {
    switch((job.status ?? "")) {
    case "job-status-closed":
        return "Job Complete"
    case "job-status-open":
        return "Open for bidding"
    case "job-status-in-progress":
        return "In Progress"
    case "job-status-action-needed":
        return "Action Needed!"
    default:
        return ""
    }
}
