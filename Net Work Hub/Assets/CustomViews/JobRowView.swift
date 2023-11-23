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
            getIcon()
                .foregroundStyle(getIconColor())
            
            VStack(alignment: .leading) {
                Text(job.jobDetail_Title ?? "")
                Text((job.define_Job_Status_Name ?? "").capitalized)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }
    
    func getIcon() -> Image {
        switch((job.define_Job_Status_Name ?? "").lowercased()) {
        case "job-status-closed":
            return Image(systemName: "checkmark.circle.fill")
        case "job-status-open":
            return Image(systemName: "minus.circle.fill")
        case "job-status-in-progress":
            return Image(systemName: "minus.circle.fill")
        case "job-status-action-needed":
            return Image(systemName: "exclamationmark.circle.fill")
        default:
            return Image(String())
        }
    }
    
    func getIconColor() -> Color {
        switch((job.define_Job_Status_Name ?? "").lowercased()) {
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
}

