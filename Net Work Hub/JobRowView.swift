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
                Text(job.title)
                Text(job.status.capitalized)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }
    
    func getIcon() -> Image {
        switch(job.status.lowercased()) {
        case "complete":
            return Image(systemName: "checkmark.circle.fill")
        case "taking bids":
            return Image(systemName: "minus.circle.fill")
        case "in progress":
            return Image(systemName: "minus.circle.fill")
        case "action needed":
            return Image(systemName: "exclamationmark.circle.fill")
        default:
            return Image(String())
        }
    }
    
    func getIconColor() -> Color {
        switch(job.status.lowercased()) {
        case "complete":
            return .green
        case "taking bids":
            return .yellow
        case "in progress":
            return .yellow
        case "action needed":
            return .red
        default:
            return .clear
        }
    }
}

