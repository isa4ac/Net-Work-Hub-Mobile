//
//  BidderRowView.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 1/30/24.
//

import SwiftUI

struct BidderRowView: View {
    @State var isExpanded = false
    var bid: JobBid
    var onAccept: () -> ()
    var onDecline: () -> ()
    @State var showEngProf = false
    @State var selectedEngId = String()
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
                        Text(((bid.firstName ?? "") + " " + (bid.lastName ?? "")).capitalized)
                            .font(isExpanded ? .title2 : .body)
                            .animation(.linear(duration: 0.3), value: isExpanded)
                        // user.yearsOfExperience
                        Text("^[\((bid.experience ?? 0), specifier: "%.1f") Year](inflect: true) of Experience")
                            .font(isExpanded ? .body : .footnote)
                            .foregroundStyle(.secondary)
                            .animation(.linear(duration: 0.3), value: isExpanded)
                        Text("^[\(bid.jobsDone ?? 0) Job](inflect: true) Complete")
                            .font(isExpanded ? .body : .footnote)
                            .foregroundStyle(.secondary)
                            .animation(.linear(duration: 0.3), value: isExpanded)
                    }
                    Group {
                        Spacer()
                        Text((bid.propAmount ?? 0.0).formatted(.currency(code: "USD")))
                            .font(isExpanded ? .body : .footnote)
                            .animation(.smooth(duration: 0.3), value: isExpanded)
                        Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
                            .symbolRenderingMode(.hierarchical)
                            .contentTransition(.symbolEffect(.automatic))
                    }
                }
                VStack(alignment: .leading) {
                    if isExpanded {
                        Text(bid.propFromEng ?? "")
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
            }
        }
        .foregroundStyle(.primary)
    }
}
