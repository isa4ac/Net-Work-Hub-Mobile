//
//  SignupView.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 3/16/24.
//

import SwiftUI

struct SignupView: View {
    @State var email = String()
    @State var password = String()
    @State var password2 = String()
    @State var firstName = String()
    @State var lastName = String()
    @State var businessName = String()
    @State var businessDescription = String()
    var body: some View {
        NavigationStack {
            List {
                Section{
                    TextField("Email", text: $email)
                    SecureField("Password", text: $password)
                    SecureField("Re-type Passwod", text: $password2)
                }
                
                Section {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    TextField("Business Name", text: $businessName)
                    TextField("Write a desciption of your business",
                              text: $businessDescription,
                              axis: .vertical)
                    .lineLimit(6...)
                }
            }
            .navigationTitle("Sign-up")
        }
    }
}

#Preview {
    SignupView()
}
