//
//  SwiftUIView.swift
//  Score Tracker
//
//  Created by Sebastian Bobadilla on 7/5/25.
//

import SwiftUI

struct TrackerView: View {
    @State var sport: SportName
    
    @Bindable var SportObject: Sport
    @Bindable var Teams: [Team]
    
    init() {
        switch sport {
        case .padel:
            SportObject = Padel()
            Teams = 
        case .pingpong:
            SportObject = Pingpong()
        case .tennis:
            SportObject = Tennis()
        }
    }
    
    var body: some View {
        Text(String(describing: sport).capitalized).font(.headline)
        HStack {
            VStack(alignment: .center) {
                Text("We")
                Text()
            }
            Spacer()
            VStack {
                Text("Them")
            }
        }.padding()
    }
}

#Preview {
    TrackerView(sport: SportName.padel)
}
