//
//  SwiftUIView.swift
//  Score Tracker
//
//  Created by Sebastian Bobadilla on 7/5/25.
//

import SwiftUI

struct TrackerView: View {
    var sport: SportName
    
    @Bindable var sportObject: Sport
    @Bindable var teamA: Team
    @Bindable var teamB: Team
    
    init(_ sport: SportName) {
        self.teamA = Team()
        self.teamB = Team()
        
        self.sport = sport
        switch sport {
        case .padel:
            sportObject = Padel()
        case .pingpong:
            sportObject = Pingpong()
        case .tennis:
            sportObject = Tennis()
        }
    }
    
    var body: some View {
        Text(String(describing: sport).capitalized).font(.headline)
        HStack() {
            VStack(alignment: .center) {
                Text("\(teamA.currentScore)")
                    .font(.system(size: 64, weight: .semibold))
                    .monospacedDigit()
                    .contentTransition(.numericText())
                    .minimumScaleFactor(0.5)
                    .padding()
                    .frame(width: 64 * 1.25, height: 64)
                    .background(RoundedRectangle(cornerRadius: 25).fill(Color.gray.opacity(0.5)))
                    .gesture(TapGesture(count: 2).onEnded {
                            withAnimation {
                                teamA.decreaseScore()
                            }
                        }.exclusively(before: TapGesture(count: 1).onEnded {
                            withAnimation {
                                teamA.increaseScore()
                            }
                        })
                    )
            }
            Spacer()
            VStack {
                Text("\(teamB.currentScore)")
                    .font(.system(size: 64, weight: .semibold))
                    .monospacedDigit()
                    .contentTransition(.numericText())
                    .minimumScaleFactor(0.5)
                    .padding()
                    .frame(width: 64 * 1.25, height: 64 * 1)
                    .background(RoundedRectangle(cornerRadius: 25).fill(Color.gray.opacity(0.5)))
                    .gesture(TapGesture(count: 2).onEnded {
                            withAnimation {
                                teamB.decreaseScore()
                            }
                        }.exclusively(before: TapGesture(count: 1).onEnded {
                            withAnimation {
                                teamB.increaseScore()
                            }
                        })
                    )
            }
        }.padding()
    }
}

#Preview {
    @Previewable @State var sport = SportName.padel
    @Previewable @State var sportObject: Sport = Padel()
    @Previewable @State var teamA: Team = Team()
    @Previewable @State var teamB: Team = Team()
    TrackerView(sport)
}
