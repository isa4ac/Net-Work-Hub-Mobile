//
//  String.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/26/23.
//

import Foundation

extension Double {
    func currencyFormatting() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        if let str = formatter.string(for: self) {
            return str
        }
        return ""
    }
}

extension String {
    // formatting text for currency textField
    func currencyFormatting() -> String {
        if let value = Double(self) {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.maximumFractionDigits = 2
            formatter.minimumFractionDigits = 2
            if let str = formatter.string(for: value) {
                return str
            }
        }
        return ""
    }
}
