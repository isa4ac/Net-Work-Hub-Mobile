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
    var profileImage: Image = Image(systemName: "person.crop.circle.fill") // TODO: Add to user object
    @State var engProfile: EngineerProfile = EngineerProfile()
    @State var user: User = User()
    var isEngineer: Bool
    
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
                Text((user.firstName ?? "") + " " + (user.lastName ?? ""))
                    .font(.title)
                    .fontWeight(.bold)
                
                List {
                    Text(user.businessName ?? "")
                        .foregroundStyle(.secondary)
                    Text(user.bio ?? "")
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
                
                if !isEngineer {
                    PrimaryButton(text: "Log Out", action: {
                        // TODO: logout logic here
                    })
                    .padding(.bottom)
                    .padding(.horizontal)
                }
            }
            .navigationBarItems(trailing: !isEngineer ? Button("Edit") {
                // TODO: Edit logic here
            } : nil)
        }
    }
}

#Preview {
    UserProfileView(isEngineer: false)
}
