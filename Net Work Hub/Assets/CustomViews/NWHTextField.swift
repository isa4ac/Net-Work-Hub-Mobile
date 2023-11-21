//
//  NWHTextRowView.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/20/23.
//

import SwiftUI

struct NWHTextRowView: View {
    var title: String
    @Binding var text: String
    var prompt = String()
    var body: some View {
        LabeledContent {
            TextField(title, text: $text, prompt: Text(prompt))
                .multilineTextAlignment(.trailing)
        } label: {
            HStack {
                Text(title)
                Spacer()
            }
        }
    }
}

//#Preview {
//    NWHTextRowView()
//}
