//
//  DateFormItemView.swift
//  centerSpot
//
//  Created by Leonardo Soares on 06/10/2025.
//

import SwiftUI

struct DateFormItemView: View {
    private(set) var title: String
    @Binding private(set) var date: Date
    
    var body: some View {
        VStack(alignment: .leading) {
            DatePicker(selection: $date) {
                AppSystemText(title, size: 20)
            }
        }
    }
}
