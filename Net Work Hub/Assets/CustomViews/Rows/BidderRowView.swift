//
//  BidderRowView.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 1/30/24.
//

import SwiftUI

struct BidderRowView: View {
    @State var isExpanded = false
    //var user: User
    var name: String
    var yearsOfExperience: Int // in user object
    var jobsComplete: Int // in user object
    var bidDescription: String // in job object
    var quotePrice: Double // in bid object
    var onAccept: () -> ()
    var onDecline: () -> ()
    var body: some View {
        // Expandable row:
        Button {
            isExpanded.toggle()
        } label: {
            VStack {
                HStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        //                    Text((user.firstName?.capitalized ?? "") + " " + (user.lastName?.capitalized ?? ""))
                        //                        .font(isExpanded ? .title2 : .body)
                        Text(name.capitalized)
                            .font(isExpanded ? .title2 : .body)
                            .animation(.linear(duration: 0.2), value: isExpanded)
                        // user.yearsOfExperience
                        Text("^[\(yearsOfExperience) Years of Experience](inflect: true)")
                            .font(isExpanded ? .body : .footnote)
                            .foregroundStyle(.secondary)
                            .animation(.linear(duration: 0.2), value: isExpanded)
                        Text("^[\(jobsComplete) Jobs Complete](inflect: true)")
                            .font(isExpanded ? .body : .footnote)
                            .foregroundStyle(.secondary)
                            .animation(.linear(duration: 0.2), value: isExpanded)
                    }
                    Group {
                        Spacer()
                        Text(quotePrice.formatted(.currency(code: "USD")))
                            .font(isExpanded ? .body : .footnote)
                            .animation(.smooth(duration: 0.2), value: isExpanded)
                        Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
                            .symbolRenderingMode(.hierarchical)
                            .contentTransition(.symbolEffect(.automatic))
                    }
                }
                VStack(alignment: .leading) {
                    if isExpanded {
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
                            .foregroundStyle(.white)
                            .buttonStyle(.borderedProminent)
                            .buttonBorderShape(.capsule)
                            
                            // Decline Button
                            Button("Decline") {
                                onDecline()
                            }
                            .tint(.red)
                            .foregroundStyle(.red)
                            .buttonStyle(.borderless)
                            .buttonBorderShape(.capsule)
                            Spacer()
                        }
                    }
                }
                .animation(.spring(duration: 0.5), value: isExpanded)
            }
        }
        .foregroundStyle(.primary)
    }
}
