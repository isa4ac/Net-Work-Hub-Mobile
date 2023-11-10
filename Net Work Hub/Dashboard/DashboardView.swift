//
//  DashboardView.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/9/23.
//

import SwiftUI

struct DashboardView: View {
    @StateObject var viewModel = ViewModel()
    
    let jobs: [Job] = [
        Job(rid: 1, userId: 1, engineerId: 101, title: "Job A", status: "in progress", categoryId: 1, category: "security", targetCost: 50000.0, targetCompletion: Date(), actualCost: 45000.0, actualCompletion: Date(), createDate: Date()),
        Job(rid: 2, userId: 2, engineerId: 102, title: "Job B", status: "complete", categoryId: 2, category: "Hardware", targetCost: 70000.0, targetCompletion: Date(), actualCost: 68000.0, actualCompletion: Date(), createDate: Date()),
        Job(rid: 3, userId: 3, engineerId: 103, title: "Job C", status: "taking bids", categoryId: 1, category: "Software", targetCost: 60000.0, targetCompletion: Date(), actualCost: 0.0, actualCompletion: Date(), createDate: Date()),
        Job(rid: 3, userId: 3, engineerId: 103, title: "Job D", status: "action needed", categoryId: 1, category: "Software", targetCost: 60000.0, targetCompletion: Date(), actualCost: 0.0, actualCompletion: Date(), createDate: Date())
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(jobs) { job in
                    NavigationLink {
                       // job detail page
                    } label: {
                        JobRowView(job: job)
                    }
                }
                .onDelete(perform: viewModel.deleteJobs)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.showUserProfile.toggle()
                    } label: {
                        Label("Your Profile", systemImage: "person.circle.fill")
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $viewModel.showUserProfile) {
            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
        }
    }
}
