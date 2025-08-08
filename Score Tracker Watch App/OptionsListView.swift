//
//  OptionsList.swift
//  Score Tracker Watch App
//
//  Created by Sebastian Bobadilla on 23/7/2025.
//

import SwiftUI

struct OptionsListView: View {
    @Bindable var sportObject: Sport
    @Bindable var teamA: Team
    @Bindable var teamB: Team
    
    var body: some View {
        NavigationStack {
            Group {
                switch sportObject {
                case is Padel:
                    Toggle("Golden point", isOn: $sportObject.goldenPoint)
                default:
                    Text("No options")
                }
                Button("Reset") {
                    teamA.resetScore()
                    teamA.resetSetsWon()
                    teamB.resetScore()
                    teamB.resetSetsWon()
                }
            }
            .padding()
        }
    }
}

#Preview() {
    @Previewable @State var sportObject: Sport = Padel()
    @Previewable @State var teamA: Team = Team()
    @Previewable @State var teamB: Team = Team()
    OptionsListView(sportObject: sportObject, teamA: teamA, teamB: teamB)
}
