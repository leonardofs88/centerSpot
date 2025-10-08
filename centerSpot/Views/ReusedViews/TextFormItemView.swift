//
//  TextFormItemView.swift
//  centerSpot
//
//  Created by Leonardo Soares on 06/10/2025.
//

import SwiftUI

struct TextFormItemView: View {
    private(set) var title: String
    private(set) var hint: String?
    
    @State private(set) var isValid: Bool = true
    
    @FocusState private(set) var isFocused: Bool
    @Binding private(set) var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            AppSystemText(title, size: 20 )
            if let hint {
                TextField(hint, text: $text)
                    .focused($isFocused)
            } else {
                TextField(text, text: $text)
                    .focused($isFocused)
            }
            Divider()
                .frame(minHeight: isValid ? 1 : 2)
                .overlay(isValid ? .blueGray : .red)
        }
        .onChange(of: isFocused, { _, focused in
            if !focused {
                isValid = !text.isEmpty
            } else {
                isValid = true
            }
            print(isValid ? "text valid" : "text invalid")
        })
        .preference(
            key: TextFormValidationKey.self,
            value: isValid ? .valid : .invalid("\(title) must not be empty")
        )
    }
}

#Preview {
    VStack {
        TextFormItemView(title: "Title", text: .constant("Text Value"))
        TextFormItemView(title: "Title 2", text: .constant("Text Value 2"))
    }
}

struct TextFormValidationKey: PreferenceKey {
    static var defaultValue: TextFormValidation = .valid
    
    static func reduce(
        value: inout TextFormValidation,
        nextValue: () -> TextFormValidation
    ) {
        value = nextValue()
    }
}

enum TextFormValidation: Equatable {
    case valid
    case invalid(String)
}
