//
//  JobBiddersView.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 1/27/24.
//

import SwiftUI

import SwiftUI

struct JobBiddersView: View {
    @StateObject var viewModel = ViewModel()
    @EnvironmentObject var dataController: DataController
    var jobId: String
    var body: some View {
        if viewModel.isLoading {
            ProgressView()
                .onFirstAppear {
                    dataController.getJobBids(jobId, completion: { bids in
                        viewModel.jobBids = bids
                        viewModel.isLoading = false
                    })
                }
        } else {
            NavigationStack {
                List {
                    // Loop through each bidder to create a GridRow
                    ForEach(viewModel.jobBids.sorted(by: {
                        switch(viewModel.sortBy) {
                        case .priceAsc:
                            return $0.propAmount ?? 0.0 < $1.propAmount ?? 0.0
                        case .priceDes:
                            return $0.propAmount ?? 0.0 > $1.propAmount ?? 0.0
                        case .jobsAsc:
                            return $0.jobsDone ?? 0 < $1.jobsDone ?? 0
                        case .jobsDes:
                            return $0.jobsDone ?? 0 > $1.jobsDone ?? 0
                        case .yearsAsc:
                            return $0.experience ?? 0 < $1.experience ?? 0
                        case .yearsDes:
                            return $0.experience ?? 0 > $1.experience ?? 0
                        }
                    }), id: \.id) { bid in
                        BidderRowView(name: (bid.firstName ?? "") + " " + (bid.lastName ?? ""),
                                      yearsOfExperience: bid.experience ?? 0,
                                      jobsComplete: bid.jobsDone ?? 0,
                                      bidDescription: bid.propFromEng ?? "",
                                      quotePrice: bid.propAmount ?? 0.0, onAccept: {
                            
                        }, onDecline: {
                            
                        })
                        .listRowSeparator(.hidden)
                    }
                }
                .navigationTitle("Job Bidders")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Menu {
                            // price sort button
                            Button {
                                // on price sort change
                                if viewModel.sortBy == .priceAsc {
                                    viewModel.sortBy = .priceDes
                                } else {
                                    viewModel.sortBy = .priceAsc
                                }
                            } label: {
                                HStack {
                                    Text("Price")
                                    if viewModel.sortBy == .priceDes {
                                        Image(systemName: "arrow.down")
                                    } else if viewModel.sortBy == .priceAsc {
                                        Image(systemName: "arrow.up")
                                    }
                                }
                            }
                            // Years of experience sort
                            Button {
                                // on Years of experience sort change
                                if viewModel.sortBy == .yearsDes {
                                    viewModel.sortBy = .yearsAsc
                                } else {
                                    viewModel.sortBy = .yearsDes
                                }
                            } label: {
                                HStack {
                                    Text("Experience")
                                    if viewModel.sortBy == .yearsDes {
                                        Image(systemName: "arrow.down")
                                    } else if viewModel.sortBy == .yearsAsc {
                                        Image(systemName: "arrow.up")
                                    }
                                }
                            }
                            // Jobs complete sort
                            Button {
                                // on Jobs complete sort change
                                if viewModel.sortBy == .jobsDes {
                                    viewModel.sortBy = .jobsAsc
                                } else {
                                    viewModel.sortBy = .jobsDes
                                }
                            } label: {
                                HStack {
                                    Text("Jobs Done")
                                    if viewModel.sortBy == .jobsDes {
                                        Image(systemName: "arrow.down")
                                    } else if viewModel.sortBy == .jobsAsc {
                                        Image(systemName: "arrow.up")
                                    }
                                }
                            }
                        } label: {
                            Label("Sort", systemImage: "arrow.up.arrow.down")
                        }
                    }
                }
            }
        }
    }
}

// Preview provider for SwiftUI canvas
struct JobBiddersView_Previews: PreviewProvider {
    static var previews: some View {
        JobBiddersView(jobId: "job-detail-e3b1ea91-dfd0-4a53-a2dc-98668d8faa5c")
    }
}

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
