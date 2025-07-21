//
//  ContentView.swift
//  Score Tracker Watch App
//
//  Created by Sebastian Bobadilla on 7/5/25.
//

import SwiftUI

struct ContentView: View {
    @State private var path: [SportName] = []
    @State var scrollAmount = 0.0
    @State var scrolling: Bool = false
    
    var body: some View {
        NavigationStack(path: $path){
            List {
                ForEach(SportName.allCases, id: \.self) { sport in
                    NavigationLink(String(describing: sport).capitalized, value: sport)
                }
            }
            .navigationDestination(for: SportName.self) { sport in
                TrackerView(sport)
            }
            .navigationTitle("Sports Tracker")
        }
    }
}

#Preview {
    ContentView()
}
