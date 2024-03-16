//
//  SignInView.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 3/15/24.
//

import SwiftUI

struct SignInView: View {
    @State var email = String()
    @State var password = String()
    var body: some View {
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
                    .padding(.top, 50)
                NWHTextEntryRowView(label: "Password", text: $password, prompt: "Password Here", format: .secure)
                    .padding(.bottom)
                PrimaryButton(text: "Login", action: {
                    // login logic here
                })
            }
            .padding()
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    SignInView()
}
