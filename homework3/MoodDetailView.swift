//
//  MoodDetailView.swift
//  MoodApp
//
//  Created by Ilvina on 02.07.2026.
//

import Foundation
import SwiftUI

struct MoodDetailView: View {
    let entry: MoodEntry
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text(entry.mood.emoji)
                        .font(.system(size: 60))
                    
                    Spacer()
                    
                    Text(entry.date.formatted(date: .complete, time: .complete))
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            .padding()
        }
        .navigationTitle("Детали")
        .navigationBarTitleDisplayMode(.inline)
    }
}
