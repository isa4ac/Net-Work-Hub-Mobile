//
//  SignInView.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 3/15/24.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var dataController: DataController
    @State var email = String()
    @State var password = String()
    @State var showSignUpView = false
    @State var showDashboardView = false
    @State var showLoading = false
    var body: some View {
        NavigationStack {
            VStack {
                Text("Net-work Hub")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(
                        LinearGradient(
                            stops: [
                                Gradient.Stop(color: Color(red: 0.44, green: 0.4, blue: 0.53), location: 0.00),
                                Gradient.Stop(color: Color(red: 0.34, green: 0.29, blue: 0.45), location: 1.00),
                            ],
                            startPoint: UnitPoint(x: 0.5, y: 0),
                            endPoint: UnitPoint(x: 0.5, y: 1)
                        )
                    )
                    .padding(.top, 100)
                
                VStack {
                    NWHTextEntryRowView(label: "Email", text: $email, prompt: "Email here")
                        .padding(8)
                        .overlay( /// apply a rounded border
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.secondary, lineWidth: 1)
                        )
                        .padding(.top, 50)
                    NWHTextEntryRowView(label: "Password", text: $password, prompt: "Password Here", format: .secure)
                        .padding(8)
                        .overlay( /// apply a rounded border
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.secondary, lineWidth: 1)
                        )
                    PrimaryButton(text: "Login", action: {
                        showLoading = true
                        DispatchQueue.main.async {
                            dataController.userLogin(email, password, completion: {
                                showLoading = false
                                showDashboardView = true
                            })
                        }
                    })
                    Button("Sign-Up") {
                        showSignUpView = true
                    }
                }
                .padding()
                
                Spacer()
            }
            .navigationDestination(isPresented: $showSignUpView) {
                SignupView()
                    .environmentObject(dataController)
            }
        }
        
        .fullScreenCover(isPresented: $showDashboardView) {
            DashboardView()
                .environmentObject(dataController)
        }
    }
}

#Preview {
    SignInView()
}
