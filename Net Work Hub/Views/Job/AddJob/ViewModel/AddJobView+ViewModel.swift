//
//  AddJobView+ViewModel.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/20/23.
//

import Foundation

extension AddJobView {
    class ViewModel: ObservableObject {
        @Published var jobTitle = String()
        @Published var jobDescription = String()
//        @Published var category = String() // TO-DO: Not in database yet
        @Published var targetBudget = String()
        @Published var targetDate = Date()
    }
}
