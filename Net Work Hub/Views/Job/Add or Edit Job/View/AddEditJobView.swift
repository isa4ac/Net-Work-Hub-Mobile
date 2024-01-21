//
//  AddEditJobView.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/20/23.
//

import SwiftUI

struct AddEditJobView: View {
    @EnvironmentObject var dataController: DataController
    @EnvironmentObject var job: Job
    @StateObject var viewModel = ViewModel()
    @Binding var isPresented: Bool
    @Binding var isMainLoading: Bool
    // if != nil, it is editting an existing job
    @State var isNewJob = false
    var body: some View {
        VStack {
            Form {
                Section {
                    NWHTextEntryRowView(label: "Post Title",
                                        text: $job.title.toUnwrapped(defaultValue: ""),
                                        prompt: "Required")
                    // TODO: MAKE A PICKER FOR CATAGORY ONCE IT HAS BEEN INTEGRATED IN API
                    NWHTextEntryRowView(label: "Target Budget",
                                        text: $job.targetBudget.toUnwrapped(defaultValue: ""),
                                        prompt: getSymbol() + "0.00 (optional)",
                                        format: .currency)
                    DatePicker("Target Completion",
                               selection: $viewModel.targetDate,
                               in: Date()...,
                               displayedComponents: .date)
    
                }
                
                Section {
                    TextField("Write a desciption of the desired outcome of the job...",
                              text: $job.description.toUnwrapped(defaultValue: ""),
                              axis: .vertical)
                        .lineLimit(6...)
                }
                
            }
            .listSectionSpacing(20)
            .onFirstAppear {
                viewModel.targetDate = viewModel.getNextWeek()
            }
            Spacer()
            PrimaryButton(text: isNewJob ? "Update Job" : "Post Job", action: {
                if viewModel.controlsValid(job) { // TODO VALIDATE JOB DATE SELECTION
                    // save job date selection as string to object
                    dataController.addUserJob(job, completion: {
                        isMainLoading = true
                        isPresented = false
                    })
                } else {
                    viewModel.showAlert.toggle()
                }
            })
            .padding()
        }
        .navigationTitle(isNewJob ? "Create Job Post" : "Update Job Post")
        .alert(isPresented: $viewModel.showAlert, content: {
            Alert(title: Text(viewModel.errorMessage))
        })
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(isNewJob ? "Update" : "Post") {
                    if !viewModel.controlsValid(job) {
                        viewModel.showAlert.toggle()
                        return
                    }
                    dataController.addUserJob(job, completion: {
                        isMainLoading = true
                        isPresented = false
                    })
                }
            }
        }
    }
}

extension Binding {
     func toUnwrapped<T>(defaultValue: T) -> Binding<T> where Value == Optional<T>  {
        Binding<T>(get: { self.wrappedValue ?? defaultValue }, set: { self.wrappedValue = $0 })
    }
}
