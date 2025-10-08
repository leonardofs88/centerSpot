//
//  InitialViewButtonStyle.swift
//  centerSpot
//
//  Created by Leonardo Soares on 21/09/2025.
//

import SwiftUI

struct AppSystemButtonStyle: ButtonStyle {
    @State private(set) var horizontalPadding: CGFloat
    @State private(set) var verticallPadding: CGFloat
    @State private(set) var backgroundColor: Color
    @State private(set) var roundedCornerRadius: CGFloat
    @State private(set) var fontColor: Color
    
    init(
        verticallPadding: CGFloat = 1,
        horizontalPadding: CGFloat = 12,
        backgroundColor: Color = .appSystemPrimary,
        roundedCornerRadius: CGFloat = 6,
        fontColor: Color = .white
    ) {
        self.verticallPadding = verticallPadding
        self.horizontalPadding = horizontalPadding
        self.backgroundColor = backgroundColor
        self.roundedCornerRadius = roundedCornerRadius
        self.fontColor = fontColor
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, verticallPadding)
            .padding(.horizontal, horizontalPadding)
            .background(backgroundColor)
            .foregroundStyle(.white)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: roundedCornerRadius
                )
            )
            .foregroundStyle(fontColor)
    }
}
