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
        switch((job.define_Job_Status_Name ?? "")) {
        case "Closed":
            return Image(systemName: "checkmark.circle.fill")
        case "Open for Bids":
            return Image(systemName: "arrow.down.forward.and.arrow.up.backward.circle.fill")
        case "Work In Progress":
            return Image(systemName: "minus.circle.fill")
        case "Action Needed From Business":
            return Image(systemName: "exclamationmark.circle.fill")
        default:
            return Image(String())
        }
    }
    
    func getIconColor() -> Color {
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
}

