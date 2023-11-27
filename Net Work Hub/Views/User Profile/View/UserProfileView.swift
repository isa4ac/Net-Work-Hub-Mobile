//
//  UserProfileView.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/14/23.
//

import SwiftUI

struct UserProfileView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        Text("User profile page")
    }
}

#Preview {
    UserProfileView()
}
