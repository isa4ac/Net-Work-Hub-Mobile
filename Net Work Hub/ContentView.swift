//
//  ContentView.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/9/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var dataController = DataController()
    @State var isLoading = true
    var body: some View {
        if (isLoading) {
            ProgressView()
                .onFirstAppear {
                    dataController.userLogin("", "", completion: {
                        dataController.getTimeZones {
                            isLoading = false
                        }
                    })
                }
        } else {
            DashboardView()
                .environmentObject(dataController)
        }
    }
}

#Preview {
    ContentView()
}
