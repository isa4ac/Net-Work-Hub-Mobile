//
//  AddJobView.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/20/23.
//

import SwiftUI

struct AddJobView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        Form {
            NWHTextRowView(title: "Job Title", text: $viewModel.jobTitle, prompt: "Required")
        }
        .navigationTitle("Create Job Post")
    }
}

#Preview {
    AddJobView()
}
