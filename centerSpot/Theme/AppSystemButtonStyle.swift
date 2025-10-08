//
//  InitialViewButtonStyle.swift
//  centerSpot
//
//  Created by Leonardo Soares on 21/09/2025.
//

import SwiftUI

struct AppSystemButtonStyle: ButtonStyle {
    @State private(set) var buttonType: AppSystemType
    @State private(set) var horizontalPadding: CGFloat
    @State private(set) var verticallPadding: CGFloat
    @State private(set) var roundedCornerRadius: CGFloat
    @State private var fontColor: Color
    @State private var backgroundColor: Color
    @State private var isEnabled: Bool
    
    init(
        buttonType: AppSystemType = .primary,
        verticallPadding: CGFloat = 10,
        horizontalPadding: CGFloat = 12,
        roundedCornerRadius: CGFloat = 6,
        isEnabled: Bool = true
    ) {
        self.buttonType = buttonType
        self.verticallPadding = verticallPadding
        self.horizontalPadding = horizontalPadding
        self.roundedCornerRadius = roundedCornerRadius
        self.isEnabled = isEnabled
        
        switch buttonType {
        case .primary:
            fontColor = .white
            backgroundColor = .appSystemPrimary
        case .secondary:
            fontColor = .blueGray
            backgroundColor = .appSystemSecondary
        case .tertiary:
            fontColor = .blueGray
            backgroundColor = .appSystemLightBorder
        }
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .opacity(isEnabled ? 1 : 0.5)
            .contentShape(Rectangle())
            .frame(minWidth: 80, minHeight: 25)
            .padding(.vertical, verticallPadding)
            .padding(.horizontal, horizontalPadding)
            .background(backgroundColor.opacity(isEnabled ? 1 : 0.5))
            .clipShape(
                RoundedRectangle(
                    cornerRadius: roundedCornerRadius
                )
            )
    }
}

enum AppSystemType {
    case primary
    case secondary
    case tertiary
}
