//
//  ContentView.swift
//  Score Tracker Watch App
//
//  Created by Sebastian Bobadilla on 7/5/25.
//

import SwiftUI

struct ContentView: View {
    @State var scrollAmount = 0.0
    @State var scrolling: Bool = false
    
    var body: some View {
        NavigationStack {
            ForEach(SportName.allCases, id: \.self) { sport in
                NavigationLink(destination: TrackerView(sport)) {
                    Text("\(sport)".capitalized)
                }
            }
            .navigationTitle("Sports Tracker")
        }
    }
}

#Preview {
    ContentView()
}
