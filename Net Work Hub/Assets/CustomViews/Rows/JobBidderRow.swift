//
//  JobBidderRow.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 1/27/24.
//

import Foundation
import SwiftUI

struct bidderRowView: View {
    @State var isExpanded = false
//    var user: User
    var name: String
    var yearsOfExperience: String // in user object
    var jobsComplete: String // in user object
    var bidDescription: String // in job object
    var quotePrice: String // in bid object
    var onAccept: () -> ()
    var onDecline: () -> ()
    var body: some View {
        // Expandable row:
        Button {
            withAnimation() {
                isExpanded.toggle()
            }
        } label: {
            VStack {
                HStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        //                    Text((user.firstName?.capitalized ?? "") + " " + (user.lastName?.capitalized ?? ""))
                        //                        .font(isExpanded ? .title2 : .body)
                        Text(name.capitalized)
                            .font(isExpanded ? .title2 : .body)
                        // user.yearsOfExperience
                        Text(yearsOfExperience + " years of experience")
                            .font(isExpanded ? .body : .footnote)
                            .foregroundStyle(.secondary)
                        Text(jobsComplete + " jobs completed")
                            .font(isExpanded ? .body : .footnote)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    Text(quotePrice)
                    if !isExpanded {
                        Image(systemName: "chevron.right")
                    } else {
                        Image(systemName: "chevron.down")
                    }
                }
                if isExpanded {
                    Text(bidDescription)
                        .multilineTextAlignment(.leading)
                    HStack {
                        // Decline Button
                        Button("Decline") {
                            onDecline()
                        }
                        .foregroundStyle(.primary)
                        .frame(maxWidth: .infinity, minHeight: 30)
                        .background(.red)
                        .cornerRadius(20)
                        .padding(.horizontal, 10)
                        Button("Accept") {
                            onAccept()
                        }
                        .foregroundStyle(.primary)
                        .frame(maxWidth: .infinity, minHeight: 30)
                        .background(.green)
                        .cornerRadius(20)
                        .padding(.horizontal, 10)
                    }
                }
            }
        }
        .foregroundStyle(.primary)
    }
}
