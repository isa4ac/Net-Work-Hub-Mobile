//
//  AddJobView.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/20/23.
//

import SwiftUI

struct AddJobView: View {
    @EnvironmentObject var dataController: DataController
    @StateObject var viewModel = ViewModel()
    @Binding var isPresented: Bool
    @Binding var isMainLoading: Bool
    var body: some View {
        VStack {
            Form {
                Section {
                    NWHTextEntryRowView(label: "Post Title", text: $viewModel.jobTitle, prompt: "Required")
                    // TODO: MAKE A PICKER FOR CATAGORY ONCE IT HAS BEEN INTEGRATED IN API
                    NWHTextEntryRowView(label: "Target Budget", text: $viewModel.targetBudget, prompt: getSymbol() + "0.00 (optional)", format: .currency)
                    DatePicker("Target Completion", selection: $viewModel.targetDate, in: Date()..., displayedComponents: .date)
    
                }
                
                Section {
                    TextField("Write a desciption of the desired outcome of the job...", text: $viewModel.jobDescription, axis: .vertical)
                        .lineLimit(6...)
                }
                
            }
            .listSectionSpacing(20)
            .onFirstAppear {
                viewModel.targetDate = viewModel.getNextWeek()
            }
            Spacer()
            PrimaryButton(text: "Post Job", action: {
                if viewModel.controlsValid() {
                    dataController.addUserJob(viewModel.generateJobObject(), completion: {
                        isMainLoading = true
                        isPresented = false
                    })
                } else {
                    viewModel.showAlert.toggle()
                }
            })
            .padding()
        }
        .navigationTitle("Create Job Post")
        .alert(isPresented: $viewModel.showAlert, content: {
            Alert(title: Text(viewModel.errorMessage))
        })
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Post") {
                    if viewModel.controlsValid() {
                        dataController.addUserJob(viewModel.generateJobObject(), completion: {
                            isMainLoading = true
                            isPresented = false
                        })
                    } else {
                        viewModel.showAlert.toggle()
                    }
                }
            }
        }
    }
}
