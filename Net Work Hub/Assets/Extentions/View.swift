//
//  View.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 11/22/23.
//

import SwiftUI

private struct OnFirstAppear: ViewModifier {
    let perform: () -> Void

    @State private var firstTime = true

    func body(content: Content) -> some View {
        content.onAppear {
            if firstTime {
                firstTime = false
                perform()
            }
        }
    }
}

extension View {
    func onFirstAppear(perform: @escaping () -> Void) -> some View {
        modifier(OnFirstAppear(perform: perform))
    }
    
    func numbersOnly(_ text: Binding<String>, includeDecimal: Bool = false, isCurrency: Bool = false) -> some View {
        self.modifier(NumberOnlyViewModifier(text: text, isCurrency: isCurrency, includeDecimal: includeDecimal))
    }
}
