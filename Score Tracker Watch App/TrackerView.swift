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
    
    @State private var showMenu = false
    
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
        NavigationStack {
            Group {
                Text(String(describing: sport).capitalized).font(.headline)
                HStack() {
                    Text("\(teamA.setsWon) - \(teamB.setsWon)")
                }.padding()
                HStack() {
                    VStack(alignment: .center) {
                        Text("\(sportObject.scoringScheme[teamA.currentScore])")
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
                                    if (teamA.currentScore < sportObject.pointsPerSet - 1) {
                                        teamA.increaseScore()
                                    } else {
                                        teamA.increaseSetsWon()
                                        teamA.resetScore()
                                        teamB.resetScore()
                                    }
                                }
                            })
                            )
                    }
                    Spacer()
                    VStack {
                        Text("\(sportObject.scoringScheme[teamB.currentScore])")
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
                                    if (teamB.currentScore < sportObject.pointsPerSet - 1) {
                                        teamB.increaseScore()
                                    } else {
                                        teamB.increaseSetsWon()
                                        teamB.resetScore()
                                        teamA.resetScore()
                                    }
                                }
                            })
                            )
                    }
                }.padding()
            }
            .sheet(isPresented: $showMenu) {
                OptionsListView(sportObject: sportObject)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Button {
                        showMenu.toggle()
                    } label: {
                        Image(systemName: "list.bullet")
                    }
                }
            }
        }
    }
}

#Preview() {
    @Previewable @State var sport = SportName.padel
    @Previewable @State var sportObject: Sport = Padel()
    @Previewable @State var teamA: Team = Team()
    @Previewable @State var teamB: Team = Team()
    TrackerView(sport)
}
