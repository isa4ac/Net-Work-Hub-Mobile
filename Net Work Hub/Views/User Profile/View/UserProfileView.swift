//
//  UserProfileView.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/14/23.
//

import SwiftUI

struct UserProfileView: View {
    @StateObject var viewModel = ViewModel()
    // Placeholder data for demonstration
    var profileImage: Image = Image(systemName: "person.crop.circle.fill")
    var userName: String = "Isaac Van Meter"
    var userDescription: String = "I am a small business that primarily focuses on mustache stuff."
    
    var body: some View {
        NavigationStack {
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
                Text(userName)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(userDescription)
                    .foregroundColor(.secondary)
                    .padding()
                
                Spacer()
                
                PrimaryButton(text: "Log Out", action: {
//                    viewModel.showAddJob = true
                })
                .padding(.bottom)
                .padding(.horizontal)
            }
            .navigationBarItems(trailing: Button("Edit") {
                // edit logic here
            })
        }
    }
}

#Preview {
    UserProfileView()
}
