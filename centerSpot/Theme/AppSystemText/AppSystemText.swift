//
//  AppSystemText.swift
//  centerSpot
//
//  Created by Leonardo Soares on 01/10/2025.
//

import SwiftUI

struct AppSystemText: View {
    var text: String
    var font: String
    var size: CGFloat
    var animated: Bool
    var color: Color
    
    @State var angle: Double = 0
    
    init(
        _ text: String?,
        weight: AppSystemTextWeight = .regular,
        size: CGFloat = 17,
        color: Color = .blueGray
    ) {
        self.text = text ?? "-"
        self.font = weight.getFont()
        self.size = size
        self.animated = false
        self.color = color
    }
    
    init(
        _ number: Int?,
        weight: AppSystemTextWeight = .regular,
        size: CGFloat = 17,
        color: Color = .blueGray
    ) {
        self.text = if let number {
            "\(number)"
        } else {
            "-"
        }
        self.size = size
        self.font = weight.getFont()
        self.animated = true
        self.color = color
    }
    
    init(
        _ value: Bool?,
        weight: AppSystemTextWeight = .regular,
        size: CGFloat = 17,
        color: Color = .blueGray
    ) {
        self.text = if let value {
            value ? "Yes" : "No"
        } else {
            "-"
        }
        self.size = size
        self.font = weight.getFont()
        self.animated = false
        self.color = color
    }
    
    var body: some View {
        if animated {
            Text(text)
                .padding(.vertical, 10)
                .padding(.horizontal, 5)
                .font(.custom(font, size: 17))
                .foregroundStyle(color)
                .rotation3DEffect(
                    .degrees(angle),
                    axis: (x: 1, y: 0, z: 0)
                )
                .onAppear {
                    withAnimation {
                        var count = 0.0
                        repeat {
                            angle = count
                            count += 1
                        } while angle < 1440
                    }
                }
        } else {
            Text(text)
                .padding(.vertical, 10)
                .padding(.horizontal, 5)
                .font(.custom(font, size: 17))
                .foregroundStyle(color)
        }
    }
}

#Preview {
    @Previewable @State var text = "JjYy"
    @Previewable @State var number = 369
    
    AppSystemText(text, weight: .regular).onTapGesture {
        text = "This text has been changed"
    }
    AppSystemText(text, weight: .condensed)
    AppSystemText(text, weight: .condensedBold)
    AppSystemText(text, weight: .bold)
    AppSystemText(number, weight: .regular)
        .onTapGesture {
            number += 1
        }
    AppSystemText(number, weight: .condensed)
    AppSystemText(number, weight: .condensedBold)
    AppSystemText(number, weight: .bold)
}

enum AppSystemTextWeight {
    case regular
    case condensed
    case condensedBold
    case bold
    
    func getFont() -> String {
        switch self {
        case .regular:
                .CustomFonts.dinNormal
        case .condensed:
                .CustomFonts.dinCondensed
        case .condensedBold:
                .CustomFonts.dinCondensedBold
        case .bold:
                .CustomFonts.dinBold
        }
    }
}
