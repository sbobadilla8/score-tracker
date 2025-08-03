//
//  OptionsList.swift
//  Score Tracker Watch App
//
//  Created by Sebastian Bobadilla on 23/7/2025.
//

import SwiftUI

struct OptionsListView: View {
    @Bindable var sportObject: Sport
//    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Group {
                switch sportObject {
                case is Padel:
                    Toggle("Golden point", isOn: $sportObject.goldenPoint)
                default:
                    Text("No options")
                }
            }
            .padding()
//            .toolbar {
//                ToolbarItem(placement: .topBarTrailing){
//                    Button {
//                        dismiss()
//                    } label: {
//                        Image(systemName: "xmark.circle")
//                    }
//                }
//            }
        }
    }
}

#Preview() {
    @Previewable @State var sportObject: Sport = Padel()
    OptionsListView(sportObject: sportObject)
}
