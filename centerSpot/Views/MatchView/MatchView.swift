//
//  MatchView.swift
//  centerSpot
//
//  Created by Leonardo Soares on 05/10/2025.
//

import SwiftUI

struct MatchView<VM: MatchViewModelProtocol>: View {
    
    @State private(set) var matchViewModel: VM
    @State private(set) var league: String = ""
    @State private(set) var season: String = ""
    @State private(set) var team: String = ""
    @State private(set) var position: String = ""
    @State private(set) var kickOff: Date = Date()
    @State private(set) var number: Int = 0
    @State private(set) var videoPath: String = ""
    
    @State private(set) var formIsValid: Bool = false
    
    @Binding private(set) var isFormPresented: Bool
    
    var body: some View {
        List {
            Section {
                TextFormItemView(title: "League", text: $league)
                TextFormItemView(title: "Season", text: $season)
                TextFormItemView(title: "Team", text: $team)
                DateFormItemView(title: "Kick-off", date: $kickOff)
                NumberFormItemView(title: "Number", number: $number)
                AppSystemImportFileInput(videoPath: $videoPath)
            } header: {
                AppSystemText(
                    "New Match",
                    weight: .bold,
                    size: 20
                )
            }
            .listRowSeparator(.hidden)
            .onPreferenceChange(TextFormValidationKey.self) { value in
                switch value {
                case .invalid(let message):
                    print(message)
                    formIsValid = false
                case .valid:
                    formIsValid = true
                }

            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Button {
                    withAnimation {
                        isFormPresented = false
                    }
                } label: {
                    AppSystemText("Cancel", weight: .bold, color: .blueGray)
                }
                .buttonStyle(AppSystemButtonStyle(buttonType: .secondary))

                Button {
                    print("tap tap")
                } label: {
                    AppSystemText("Save", weight: .bold, color: .white)
                }
                .buttonStyle(
                    AppSystemButtonStyle()
                )
                .disabled(!formIsValid)
            }
        }
        .listStyle(.inset)
    }
}

#Preview {
    MatchView(
        matchViewModel: MatchViewModel(),
        isFormPresented: .constant(true)
    )
}
