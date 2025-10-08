//
//  AppSystemText.swift
//  centerSpot
//
//  Created by Leonardo Soares on 01/10/2025.
//

import SwiftUI

struct AppSystemText: View {
    @State var viewModel: AppSystemTextViewModel
    
    init(viewModel: AppSystemTextViewModel) {
        self.viewModel = viewModel
    }
    
    init(_ text: String, weight: AppSystemTextWeight = .regular) {
        self.viewModel = AppSystemTextViewModel(text, weight: weight)
    }
    
    init(_ number: Int, weight: AppSystemTextWeight = .regular) {
        self.viewModel = AppSystemTextViewModel("\(number)", weight: weight)
    }
    
    var body: some View {
        if let text = viewModel.text {
            Text(text)
                .padding(.vertical, 10)
                .padding(.horizontal, 5)
                .font(.custom(viewModel.fontWeight, size: viewModel.size))
                .foregroundStyle(viewModel.color)
        }
    }
    
}

#Preview {
    @Previewable @State var viewModelRegular = AppSystemTextViewModel("JYjy")
    @Previewable @State var viewModelBold = AppSystemTextViewModel("JYjy", weight: .bold)
    @Previewable @State var viewModelCondensed = AppSystemTextViewModel("JYjy", weight: .condensedBold)
    AppSystemText(viewModel: viewModelRegular)
    AppSystemText(viewModel: viewModelBold)
    AppSystemText(viewModel: viewModelCondensed)
}

enum AppSystemTextWeight {
    case regular
    case condensed
    case condensedBold
    case bold
}
