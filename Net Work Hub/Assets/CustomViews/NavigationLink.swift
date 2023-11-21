//
//  NavigationLink.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/20/23.
//

import SwiftUI

struct NWHNavigationLink<Destination: View>: View {
    
    let destination : Destination
    let label : String
    let icon : String
    let isActive : Binding<Bool>?

    init(destination: Destination, isActive: Binding<Bool>? = nil, label: String = "", icon: String  = "") {
        self.destination = destination
        self.label = String()
        self.isActive = isActive
        self.icon = icon
    }

    var body: some View {
        NavigationLink {
            
        } label: {
            Label(
                title: { Text(label) },
                icon: { Image(systemName: icon) }
            )
        }
    }
}
