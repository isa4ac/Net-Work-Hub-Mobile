//
//  NWHTextEntryRowView.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/20/23.
//

import SwiftUI
import Combine

struct NWHTextEntryRowView: View {
    var label: String
    @Binding var text: String
    var prompt = String()
    var labelBold = false
    var format = BaseFormat.string
    var icon = String()
    var iconColor = Color.primary
    
    var body: some View {
        LabeledContent {
            if format == .currency {
                TextField(label, text: $text, prompt: Text(prompt))
                    .multilineTextAlignment(.trailing)
                    .numbersOnly($text, isCurrency: true)
                
            } else if format == .percent {
                HStack {
                    TextField(label, text: $text, prompt: Text(prompt))
                        .multilineTextAlignment(.trailing)
                        .numbersOnly($text, includeDecimal: true)
                    Text("%")
                }
            } else if format == .secure {
                SecureField(text: $text, label: {
                    Text(prompt)
                })
                .multilineTextAlignment(.trailing)
            } else {
                TextField(label, text: $text, prompt: Text(prompt))
                    .multilineTextAlignment(.trailing)
            }
        } label: {
            HStack {
                if icon != String() {
                    Image(systemName: icon)
                        .foregroundColor(iconColor)
                }
                Text(label)
                    .bold(labelBold)
                Spacer()
            }
        }
    }
    
    func getCurrencyFormat() -> Formatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter
    }
    
    func getPercentFormat() -> Formatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .percent
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter
    }
}


enum BaseFormat {
    case string
    case currency
    case percent
    case secure
}


