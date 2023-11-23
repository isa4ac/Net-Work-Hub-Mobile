//
//  ContentView.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/9/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var dataController = DataController()
    var body: some View {
        DashboardView()
            .onFirstAppear {
                // TODO: UPDATE TO USE AUTHENTICATION SERVICE'S RESPONSE
                dataController.currentUserId = 2
            }
            .environmentObject(dataController)
    }
}

#Preview {
    ContentView()
}
