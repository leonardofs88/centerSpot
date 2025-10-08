//
//  CollapsableItemView.swift
//  centerSpot
//
//  Created by Leonardo Soares on 01/10/2025.
//

import SwiftUI

struct CollapsableItemView: View {

    private(set) var title: String?
    private(set) var numberTitle: Int?
    private(set) var description: String?
    private(set) var numberDescription: Int?
    private(set) var boolDescription: Bool?
    
    init(_ title: String?, description: String?) {
        self.title = title
        self.description = description
    }
    
    init(_ title: Int?, description: String?) {
        self.numberTitle = title
        self.description = description ?? "-"
    }
    
    init(_ title: String?, description: Int?) {
        self.title = title
        self.numberDescription = description
    }
    
    init(_ title: Int?, description: Int?) {
        self.numberTitle = title
        self.numberDescription = description
    }
    
    init(_ title: String?, description: Bool?) {
        self.title = title
        self.boolDescription = description
    }
    
    init(_ title: Int?, description: Bool?) {
        self.numberTitle = title
        
        self.boolDescription = description
    }
    
    var body: some View {
        HStack {
            if let title {
                AppSystemText(title, weight: .bold)
            }
            
            if let numberTitle {
                AppSystemText(numberTitle, weight: .bold)
            }
            
            Spacer()
            
            if let description {
                AppSystemText(
                    description,
                    weight: .regular
                )
            }
            
            if let numberDescription {
                AppSystemText(
                    numberDescription,
                    weight: .regular
                )
            }
            
            if let boolDescription {
                AppSystemText(
                    boolDescription,
                    weight: .regular
                )
            }
        }
    }
}

#Preview {
    
    // Title as String, description as Stirng
    CollapsableItemView("Hello", description: "World")
    // Title as String, description as number
    CollapsableItemView("Hello", description: 123)
    // Numbers only
    CollapsableItemView(123, description: 456)
}
