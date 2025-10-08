//
//  CollapsableContainerView.swift
//  centerSpot
//
//  Created by Leonardo Soares on 01/10/2025.
//

import SwiftUI

struct CollapsableContainerView<ContentView: View>: View {
    @Namespace private var animation
    @State private var description: String?
    @State private var title: String?
    @State private var backgroundColor: Color = .white
    @State private var alignment: Alignment
    @State private var weight: AppSystemTextWeight = .regular
    @State private var isExpanded: Bool = false
    
    private(set) var content: () -> (ContentView)
    private(set) var action: (() -> Void)?
    
    init(
        _ title: String?,
        description: String? = nil,
        alignment: Alignment = .leading,
        @ViewBuilder content: @escaping () -> (ContentView),
        action: (() -> Void)? = nil
    ) {
        self.description = description
        self.alignment = alignment
        self.title = title
        self.content = content
        self.action = action
    }
    
    init(
        _ number: Int?,
        description: String? = nil,
        alignment: Alignment = .leading,
        @ViewBuilder content: @escaping () -> (ContentView),
        action: (() -> Void)? = nil
    ) {
        self.description = description
        self.alignment = alignment
        self.title = "\(number ?? 0)"
        self.content = content
        self.action = action
    }
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    HStack(spacing: 15) {
                        VStack {
                            AppSystemText(title, weight: weight)
                                .scaleEffect(isExpanded ? 1.5 : 1)
                            
                            if let description, !isExpanded {
                                AppSystemText(
                                    description,
                                    weight: weight
                                )
                            }
                        }
                        
                        if isExpanded {
                            Image(systemName: .chevronUp)
                                .padding()
                                .transition(.scale)
                                .fontWidth(.expanded)
                                .fontWeight(.semibold)
                                .fontDesign(.rounded)
                                .matchedGeometryEffect(
                                    id: String.chevron,
                                    in: animation,
                                    properties: [.position]
                                )
                                .clipShape(
                                    Circle()
                                )
                        }
                    }
                    
                    if !isExpanded {
                        Spacer()
                        Image(systemName: .chevronDown)
                            .padding()
                            .transition(.scale)
                            .fontWidth(.expanded)
                            .fontWeight(.semibold)
                            .fontDesign(.rounded)
                            .clipShape(
                                Circle()
                            )
                            .matchedGeometryEffect(
                                id: String.chevron,
                                in: animation,
                                properties: [.position]
                            )
                            .matchedGeometryEffect(
                                id: String.shape,
                                in: animation,
                                properties: [.position]
                            )
                    }
                }
                .frame(maxWidth: .infinity, alignment: alignment)
                Divider()
                    .frame(height: isExpanded ? 2 : 0.5)
                    .padding(.horizontal, 30)
                    .background(.appSystemPrimary)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                backgroundColor = .appSystemPrimary.opacity(0.1)
                withAnimation(.spring) {
                    backgroundColor = .white
                    isExpanded.toggle()
                    alignment = isExpanded ? .center : .leading
                    weight = isExpanded ? .bold : .regular
                }
            }
            
            if isExpanded {
                VStack {
                    content()
                }
                .matchedGeometryEffect(
                    id: String.shape,
                    in: animation,
                    properties: [.position]
                )
                .onAppear {
                    action?()
                }
                .transition(.scale)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()
            }
        }
        .foregroundStyle(.blueGray)
        .background(backgroundColor)
    }
}

#Preview {
    CollapsableContainerView("Title") {
        AppSystemText("this is a text")
        AppSystemText(123456)
    } action: {
        print("hello")
    }
}

extension String {
    static let shape = "shape"
    static let chevron = "chevron"
    static let chevronDown = "chevron.down"
    static let chevronUp = "chevron.up"
}
