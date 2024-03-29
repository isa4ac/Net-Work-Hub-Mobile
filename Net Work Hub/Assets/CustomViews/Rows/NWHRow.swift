//
//  NWHRow.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/25/23.
//

import SwiftUI

struct NWHRow: View {
    var label: String
    @State var detailText = String()
    @State var icon = String()
    @State var iconColor = Color.primary
    @State var detailIcon = String()
    @State var detailIconColor = Color.secondary
    var body: some View {
        HStack {
            if icon != String() {
                Image(systemName: icon)
                    .foregroundStyle(iconColor)
            }
            Text(label)
                .multilineTextAlignment(.trailing)
            Spacer()
            Text(detailText)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.trailing)
            if detailIcon != String() {
                Image(systemName: detailIcon)
                    .foregroundStyle(detailIconColor)
            }
        }
        
    }
}
