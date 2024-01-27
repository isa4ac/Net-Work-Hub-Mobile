//
//  JobBidders.swift
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
    let jobsDone: Int
    let bidAmount: String
}

struct JobBiddersView: View {
    // Sample data for bidders
    let bidders = [
        Bidder(name: "Bob", experience: "0yrs", jobsDone: 0, bidAmount: "$10"),
        Bidder(name: "Isaac Van Meter", experience: "1yr", jobsDone: 3, bidAmount: "$100"),
        Bidder(name: "Reesé Tuttle", experience: "2yrs", jobsDone: 10, bidAmount: "$200"),
        Bidder(name: "Evan Saxton", experience: "3yrs", jobsDone: 23, bidAmount: "$300"),
        Bidder(name: "Jared Helton", experience: "3yrs", jobsDone: 30, bidAmount: "$400")
    ]
    
    var body: some View {
        ScrollView {
            Grid {
                // Loop through each bidder to create a GridRow
                ForEach(bidders) { bidder in
                    GridRow {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                        Text(bidder.name)
                            .frame(maxWidth: .infinity, alignment: .leading) // This ensures left alignment
                        Text(bidder.experience)
                        Text("\(bidder.jobsDone)")
                        Text(bidder.bidAmount)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Job Bidders")
    }
}

// Preview provider for SwiftUI canvas
struct JobBiddersView_Previews: PreviewProvider {
    static var previews: some View {
        JobBiddersView()
    }
}
