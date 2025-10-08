//
//  NumberFormItemView.swift
//  centerSpot
//
//  Created by Leonardo Soares on 06/10/2025.
//

import SwiftUI

struct NumberFormItemView: View {
    private(set) var title: String
    private(set) var hint: String?
    @State private(set) var isValid: Bool = false
    @FocusState private(set) var isFocused: Bool
    
    @Binding private(set) var number: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            AppSystemText(title, size: 20)
            
            if let hint {
                TextField(hint, value: $number, format: .number)
                    .focused($isFocused)
            } else {
                TextField(title, value: $number, format: .number)
                    .focused($isFocused)
            }
            
            Divider()
                .frame(minHeight: isValid ? 1 : 2)
                .overlay(isValid ? .blueGray : .red)
        }
        .onChange(of: isFocused, { _, focused in
            if !focused {
                isValid = number > 1
            } else {
                isValid = true
            }
            print(isValid ? "number valid" : "number invalid")
        })
        .preference(
            key: TextFormValidationKey.self,
            value: isValid ? .valid : .invalid("\(title) must be greater than 1")
        )
    }
}
