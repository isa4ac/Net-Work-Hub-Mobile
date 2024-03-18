//
//  JobBiddersView+ViewModel.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 3/11/24.
//

import Foundation

enum SortBy {
    case priceAsc
    case priceDes
    case jobsAsc
    case jobsDes
    case yearsAsc
    case yearsDes
}

extension JobBiddersView {
    @MainActor
    class ViewModel: ObservableObject {
        @Published var jobBids = [JobBid]()
        @Published var sortBy = SortBy.priceAsc
        @Published var isLoading = true
    }
}
