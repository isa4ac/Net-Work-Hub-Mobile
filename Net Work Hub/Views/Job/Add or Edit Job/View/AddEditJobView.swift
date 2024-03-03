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
        NavigationStack {
            VStack {
                Form {
                    Section {
                        NWHTextEntryRowView(label: "Post Title",
                                            text: $job.title.toUnwrapped(defaultValue: ""),
                                            prompt: "Required")
                        // TODO: MAKE A PICKER FOR CATAGORY ONCE IT HAS BEEN INTEGRATED IN API
                        NWHTextEntryRowView(label: "Target Budget",
                                            text: $viewModel.targetBudget,
                                            prompt: getSymbol() + "0.00 (optional)",
                                            format: .currency)
                        DatePicker("Target Completion",
                                   selection: $viewModel.targetDate,
                                   in: Date()...,
                                   displayedComponents: .date)
                        
                    }
                    
                    Section {
                        TextField("Write a desciption of the desired outcome of the job...",
                                  text: $job.details.toUnwrapped(defaultValue: ""),
                                  axis: .vertical)
                        .lineLimit(6...)
                    }
                    
                }
                .listSectionSpacing(20)
                .onFirstAppear {
                    if isNewJob {
                        viewModel.targetDate = viewModel.getNextWeek()
                    }
                }
                Spacer()
                PrimaryButton(text: isNewJob ? "Post Job" : "Update Job", action: {
                    viewModel.addJob(job, isNew: isNewJob, completion: {
                        isPresented = false
                        isMainLoading = true
                    }, dataController)
                })
                .padding()
            }
            .navigationTitle(isNewJob ? "Create Job Post" : "Update Job Post")
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text(viewModel.errorMessage))
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(isNewJob ? "Post" : "Update") {
                        viewModel.addJob(job, isNew: isNewJob, completion: {
                            isPresented = false
                            isMainLoading = true
                        }, dataController)
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        // check if there where any edits, from the original
                        if viewModel.wasEditted(job) {
                            // send alert her
                            
                        } else { // if no changes:
                            isPresented = false
                        }
                    }
                }
            }
            .onAppear {
                viewModel.loadValues(job)
                viewModel.saveJob(job)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

extension Binding {
    func toUnwrapped<T>(defaultValue: T) -> Binding<T> where Value == Optional<T>  {
        Binding<T>(get: { self.wrappedValue ?? defaultValue }, set: { self.wrappedValue = $0 })
    }
}
