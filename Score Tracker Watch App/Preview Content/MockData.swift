//
//  MockData.swift
//  Score Tracker Watch App
//
//  Created by Sebastian Bobadilla on 20/7/2025.
//

import SwiftData
import SwiftUI

struct MockData: PreviewModifier {
    func body(content: Content, context: ModelContainer) -> some View {
        content.modelContainer(context)
    }
    static func makeSharedContext() async throws -> ModelContainer {
        let container = try! ModelContainer(
            for: Team.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        
        Team.mockTeams.forEach { team in
            container.mainContext.insert(team)
        }
        
        return container
    }
}

extension PreviewTrait where T == Preview.ViewTraits {
    static var mockData: Self = .modifier(MockData())
}
