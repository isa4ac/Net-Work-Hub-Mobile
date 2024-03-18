//
//  SignupView.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 3/16/24.
//

import SwiftUI

struct SignupView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var dataController: DataController
    @State var email = String()
    @State var password = String()
    @State var password2 = String()
    @State var firstName = String()
    @State var lastName = String()
    @State var businessName = String()
    @State var businessLocation = String()
    @State var businessDescription = String()
    @State var showDashboard = false
    @State var showAlert = false
    var body: some View {
        NavigationStack {
            List {
                Section{
                    TextField("Email", text: $email)
                    SecureField("Password", text: $password)
                    SecureField("Re-type Password", text: $password2)
                }
                
                Section {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    TextField("Business Name", text: $businessName)
                    TextField("Business Locaiton", text: $businessLocation)
                    TextField("Write a desciption of your business",
                              text: $businessDescription,
                              axis: .vertical)
                    .lineLimit(6...)
                }
            }
            Spacer()
            PrimaryButton(text: "Sign Up", action: { // TODO: Add time zone selection
                dataController.signUp(email, password, firstName, lastName, "timezone-us-eastern", businessName, businessLocation, businessDescription, completion: {
                    if dataController.currentUser.id == "" {
                        showAlert = true
                    } else {
                        showDashboard = true
                    }
                })
            })
            .padding(.horizontal)
            .navigationTitle("Sign Up")
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("Email already in use."))
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        dataController.signUp(email, password, firstName, lastName, "timezone-us-eastern", businessName, businessLocation, businessDescription, completion: {
                            if dataController.currentUser.id == "" {
                                showAlert = true
                            } else {
                                showDashboard = true
                            }
                        })
                    }
                }
            }
            .navigationDestination(isPresented: $showDashboard) {
                DashboardView()
                    .environmentObject(dataController)
            }
        }
    }
}

#Preview {
    SignupView()
}
