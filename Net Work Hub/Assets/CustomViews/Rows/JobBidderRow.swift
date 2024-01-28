//
//  JobBidderRow.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 1/27/24.
//

import Foundation
import SwiftUI

struct bidderRowView: View {
//    var user: User
    var name: String
    var yearsOfExperience: Int // in user object
    var jobsComplete: Int // in user object
    var bidDescription: String // in job object
    var quotePrice: Double // in bid object
    var onAccept: () -> ()
    var onDecline: () -> ()
    var body: some View {
        // Expandable row:
        DisclosureGroup {
            VStack {
                Text(bidDescription)
                    .multilineTextAlignment(.leading)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                HStack {
                    // Accept Button
                    Button("Accept") {
                        onAccept()
                    }
                    .tint(.green)
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .controlSize(.large)
                    // Decline Button
                    Button("Decline") {
                        onDecline()
                    }
                    .tint(.red)
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.capsule)
                    .controlSize(.large)
                    Spacer()
                }
            }
            .padding(.leading, -20)
        } label: {
            VStack {
                HStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        //                    Text((user.firstName?.capitalized ?? "") + " " + (user.lastName?.capitalized ?? ""))
                        //                        .font(isExpanded ? .title2 : .body)
                        Text(name.capitalized)
                            .font(.body) // was title2
                        // user.yearsOfExperience
                        Text("^[\(yearsOfExperience) Years of Experience](inflect: true)")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                        Text("^[\(jobsComplete) Jobs Complete](inflect: true)")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    Text(quotePrice.formatted(.currency(code: "USD")))
                }
            }
        }
    }
}
