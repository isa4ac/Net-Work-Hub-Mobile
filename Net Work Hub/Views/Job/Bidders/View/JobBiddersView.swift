//
//  JobBiddersView.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 1/27/24.
//

import SwiftUI

import SwiftUI

// Define the model for each bidder
struct Bidder: Identifiable {
    let id = UUID()
    let name: String
    let experience: Int
    let jobsDone: Int
    let bidAmount: Double
}

enum SortBy {
    case priceAsc
    case priceDes
    case jobsAsc
    case jobsDes
    case yearsAsc
    case yearsDes
}

struct JobBiddersView: View {
    // Sample data for bidders
    let bidders = [
        Bidder(name: "Bob", experience: 0, jobsDone: 0, bidAmount: 10.0),
        Bidder(name: "Isaac Van Meter", experience: 1, jobsDone: 300, bidAmount: 100.0),
        Bidder(name: "Reesé Tuttle", experience: 2, jobsDone: 10, bidAmount: 200.0),
        Bidder(name: "Evan Saxton", experience: 4, jobsDone: 23, bidAmount: 300.0),
        Bidder(name: "Jared Helton", experience: 10, jobsDone: 30, bidAmount: 400.0)
    ]
    @State var sortBy = SortBy.priceAsc
    var body: some View {
        NavigationStack {
            List {
                // Loop through each bidder to create a GridRow
                ForEach(bidders.sorted(by: {
                    switch(sortBy) {
                    case .priceAsc:
                        return $0.bidAmount < $1.bidAmount
                    case .priceDes:
                        return $0.bidAmount > $1.bidAmount
                    case .jobsAsc:
                        return $0.jobsDone < $1.jobsDone
                    case .jobsDes:
                        return $0.jobsDone > $1.jobsDone
                    case .yearsAsc:
                        return $0.experience < $1.experience
                    case .yearsDes:
                        return $0.experience > $1.experience
                    }
                })) { bidder in
                    bidderRowView(name: bidder.name, yearsOfExperience: bidder.experience, jobsComplete: bidder.jobsDone,
                                  bidDescription: "SAMPLE BID DESCRIPTION SAMPLE BID DESCRIPTION SAMPLE BID DESCRIPTION SAMPLE BID DESCRIPTION SAMPLE BID DESCRIPTION SAMPLE BID DESCRIPTION SAMPLE BID DESCRIPTION ",
                                  quotePrice: bidder.bidAmount, onAccept: {
                        
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
                            if sortBy == .priceAsc {
                                sortBy = .priceDes
                            } else {
                                sortBy = .priceAsc
                            }
                        } label: {
                            HStack {
                                Text("Price")
                                if sortBy == .priceDes {
                                    Image(systemName: "arrow.down")
                                } else if sortBy == .priceAsc {
                                    Image(systemName: "arrow.up")
                                }
                            }
                        }
                        // Years of experience sort
                        Button {
                            // on Years of experience sort change
                            if sortBy == .yearsDes {
                                sortBy = .yearsAsc
                            } else {
                                sortBy = .yearsDes
                            }
                        } label: {
                            HStack {
                                Text("Experience")
                                if sortBy == .yearsDes {
                                    Image(systemName: "arrow.down")
                                } else if sortBy == .yearsAsc {
                                    Image(systemName: "arrow.up")
                                }
                            }
                        }
                        // Jobs complete sort
                        Button {
                            // on Jobs complete sort change
                            if sortBy == .jobsDes {
                                sortBy = .jobsAsc
                            } else {
                                sortBy = .jobsDes
                            }
                        } label: {
                            HStack {
                                Text("Jobs Done")
                                if sortBy == .jobsDes {
                                    Image(systemName: "arrow.down")
                                } else if sortBy == .jobsAsc {
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

// Preview provider for SwiftUI canvas
struct JobBiddersView_Previews: PreviewProvider {
    static var previews: some View {
        JobBiddersView()
    }
}
