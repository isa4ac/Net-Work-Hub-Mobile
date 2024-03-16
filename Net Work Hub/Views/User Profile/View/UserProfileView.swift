//
//  UserProfileView.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/14/23.
//

import SwiftUI

struct UserProfileView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var dataController: DataController
    @StateObject var viewModel = ViewModel()
    // Placeholder data for demonstration
    var profileImage: Image = Image(systemName: "person.crop.circle.fill") // TODO: Add to user object
    @State var engineerId = ""
    @State var showEditView = false
    
    var body: some View {
        if engineerId != "" && viewModel.isLoading {
            ProgressView()
                .onFirstAppear {
                dataController.getEngProfile(engineerId, completion: { engProf in
                    viewModel.engProfile = engProf
                    viewModel.isLoading = false
                })
            }
        } else {
            VStack {
                HStack(alignment: .center) {
                    profileImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .shadow(radius: 7)
                }
                .padding(.horizontal)
                if engineerId != "" {
                    Text((viewModel.engProfile.firstName ?? "") + " " + (viewModel.engProfile.lastName ?? ""))
                        .font(.title)
                        .fontWeight(.bold)
                    
                    List {
                        Section("Background"){
                            NWHRow(label: "Experience",
                                   detailText: String(format: "%.1f", viewModel.engProfile.experience ?? 0.0))
                            NWHRow(label: "Jobs Done",
                                   detailText: String(describing: viewModel.engProfile.jobsDone ?? 0))
                            NWHRow(label: "Rating",
                                   detailText: String(format: "%.1f", viewModel.engProfile.avgReview ?? 0.0)) // TODO: MAKE RATING ROW VIEW
                        }
                        Section("Bio") {
                            Text(viewModel.engProfile.bio ?? "")
                                .foregroundStyle(.secondary)
                        }
                    }
                } else {
                    Text((dataController.currentUser.firstName ?? "") + " " + (dataController.currentUser.lastName ?? ""))
                        .font(.title)
                        .fontWeight(.bold)
                    
                    List {
                        Text(dataController.currentUser.businessName ?? "")
                            .foregroundStyle(.secondary)
                        Text(dataController.currentUser.bio ?? "")
                            .foregroundStyle(.secondary)
                    }
                }
                
                Spacer()
                
                if engineerId == "" {
                    PrimaryButton(text: "Log Out", action: {
                        // TODO: logout logic here
                    })
                    .padding(.bottom)
                    .padding(.horizontal)
                }
            }
            .navigationBarItems(trailing: engineerId == "" ? Button("Edit") {
                // TODO: Edit logic here
                showEditView = true
            } : nil)
            .navigationDestination(isPresented: $showEditView) {
                UpdateProfileView()
            }
        }
    }
}

//#Preview {
//    UserProfileView(isEngineer: false)
//}
