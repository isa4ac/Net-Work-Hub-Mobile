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
    let experience: String
    let jobsDone: String
    let bidAmount: String
}

struct JobBiddersView: View {
    // Sample data for bidders
    let bidders = [
        Bidder(name: "Bob", experience: "0", jobsDone: "0", bidAmount: "$10"),
        Bidder(name: "Isaac Van Meter", experience: "1", jobsDone: "3", bidAmount: "$100"),
        Bidder(name: "Reesé Tuttle", experience: "2", jobsDone: "10", bidAmount: "$200"),
        Bidder(name: "Evan Saxton", experience: "3", jobsDone: "23", bidAmount: "$300"),
        Bidder(name: "Jared Helton", experience: "3", jobsDone: "30", bidAmount: "$400")
    ]
    
    var body: some View {
        NavigationStack {
            List {
//            ScrollView {
                // Loop through each bidder to create a GridRow
                ForEach(bidders) { bidder in
                    bidderRowView(name: bidder.name, yearsOfExperience: bidder.experience, jobsComplete: bidder.jobsDone,
                                  bidDescription: "SAMPLE BID DESCRIPTION SAMPLE BID DESCRIPTION SAMPLE BID DESCRIPTION SAMPLE BID DESCRIPTION SAMPLE BID DESCRIPTION SAMPLE BID DESCRIPTION SAMPLE BID DESCRIPTION ",
                                  quotePrice: bidder.bidAmount, onAccept: {
                        
                    }, onDecline: {
                        
                    })
                }
            }
            .navigationTitle("Job Bidders")
        }
    }
}

// Preview provider for SwiftUI canvas
struct JobBiddersView_Previews: PreviewProvider {
    static var previews: some View {
        JobBiddersView()
    }
}
