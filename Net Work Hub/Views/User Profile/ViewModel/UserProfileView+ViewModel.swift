//
//  UserProfileView+ViewModel.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/14/23.
//

import Foundation

extension UserProfileView {
    class ViewModel: ObservableObject {
        @Published var isLoading = true
        @Published var engProfile = EngineerProfile()
    }
}
