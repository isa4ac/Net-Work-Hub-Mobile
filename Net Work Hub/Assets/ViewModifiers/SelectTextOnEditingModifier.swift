//
//  SelectTextOnEditingModifier.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 3/15/24.
//

import Foundation
import SwiftUI

public struct SelectTextOnEditingModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .onReceive(NotificationCenter.default.publisher(for: UITextField.textDidBeginEditingNotification)) { obj in
                // Click to select all the text.
                if let textField = obj.object as? UITextField {
                    textField.selectAll(nil)
                }
            }
    }
}

extension View {

    /// Select all the text in a TextField when starting to edit.
    /// This will not work with multiple TextField's in a single view due to not able to match the selected TextField with underlying UITextField
    public func selectAllTextOnEditing() -> some View {
        modifier(SelectTextOnEditingModifier())
    }
}
