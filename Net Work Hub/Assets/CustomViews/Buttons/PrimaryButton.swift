//
//  PrimaryButton.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/14/23.
//

import SwiftUI

struct PrimaryButton: View {
    var text: String
    var action: () -> ()
    var body: some View {
        HStack() {
            Spacer()
            Text(text)
                .foregroundStyle(Color(.white))
            Spacer()
        }
        .padding()
        .background(
            LinearGradient(
                stops: [
                    Gradient.Stop(color: Color(red: 0.44, green: 0.4, blue: 0.53), location: 0.00),
                    Gradient.Stop(color: Color(red: 0.34, green: 0.29, blue: 0.45), location: 1.00),
                ],
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 1)
            )
        )
        .cornerRadius(20)
        .onTapGesture {
            action()
        }
    }
}
