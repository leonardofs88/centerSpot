//
//  CollapsableContainerView.swift
//  centerSpot
//
//  Created by Leonardo Soares on 01/10/2025.
//

import SwiftUI

struct CollapsableContainerView<ContentView: View>: View {
    
    @Namespace private var animation
    @State private var title: String
    @State private var description: String?
    @State private var appSystemTextViewModel: AppSystemTextViewModel
    @State private var backgroundColor: Color = .clear
    @State private var alignment: Alignment
    @State private var isExpanded: Bool
    
    private(set) var label: (() -> (ContentView))?
    private(set) var content: () -> (ContentView)
    
    init(
        _ title: String,
        description: String? = nil,
        alignment: Alignment = .leading,
        isExpanded: Bool = false,
        label: (() -> (ContentView))? = nil,
        @ViewBuilder content: @escaping () -> (ContentView)
    ) {
        self.title = title
        self.description = description
        self.alignment = alignment
        self.isExpanded = isExpanded
        self.appSystemTextViewModel = AppSystemTextViewModel(title)
        self.content = content
    }
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                        HStack(alignment: .center, spacing: 5) {
                            AppSystemText(viewModel: appSystemTextViewModel)
                                .scaleEffect(isExpanded ? 1.5 : 1)
                            
                            if let description, !isExpanded {
                                AppSystemText(
                                    viewModel: AppSystemTextViewModel(
                                        description
                                    )
                                )
                            }
                        }
                    
                    if !isExpanded {
                        Spacer()
                        Image(systemName: .chevronDown)
                            .matchedGeometryEffect(id: String.shape, in: animation, properties: [.position])
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    backgroundColor = .appSystemPrimary.opacity(0.1)
                    withAnimation {
                        backgroundColor = .clear
                        isExpanded.toggle()
                        alignment = isExpanded ? .center : .leading
                        appSystemTextViewModel.setWeight(isExpanded ? .bold : .regular)
                    }
                }
                .frame(maxWidth: .infinity, alignment: alignment)
                Divider()
                    .frame(height: isExpanded ? 2 : 0.5)
                    .padding(.horizontal, 30)
                    .background(.appSystemPrimary)
            }
            
            if isExpanded {
                VStack {
                    content()
                        .matchedGeometryEffect(id: String.shape, in: animation, properties: [.position])
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .background(backgroundColor)
    }
}

#Preview {
    CollapsableContainerView("Title") {
        AppSystemText(viewModel: AppSystemTextViewModel("this is a text"))
    }
    
    
    CollapsableContainerView("Title", description: "Description") {
        AppSystemText(viewModel: AppSystemTextViewModel("this is a text"))
    }
}

extension String {
    static let shape: String = "shape"
    static let chevronDown = "chevron.down"
}
