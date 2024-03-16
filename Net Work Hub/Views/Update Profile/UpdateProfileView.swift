//
//  UpdateProfileView.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 3/15/24.
//

import SwiftUI

struct UpdateProfileView: View {
    @EnvironmentObject var dataController: DataController
    @State var bName = String()
    @State var bio = String()
    var body: some View {
        NavigationStack {
            List {
                NWHTextEntryRowView(label: "Business Name", text: $bName, prompt: "Name Here")
                Section("Bio"){
                    TextEditor(text: $bio)
                }
            }
            .navigationTitle("Edit Account")
            PrimaryButton(text: "Update", action: {
                dataController.updateUserProfile(dataController.currentUser.id, bName, bio, completion: { 
                    dataController.currentUser.businessName = bName
                    dataController.currentUser.bio = bio
                })
            })
        }
        .onFirstAppear {
            bName = dataController.currentUser.businessName ?? ""
            bio = dataController.currentUser.bio ?? ""
        }
    }
}
