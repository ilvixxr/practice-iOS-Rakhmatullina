//
//  MoodPicker.swift
//  MoodApp
//
//  Created by Ilvina on 01.07.2026.
//
import SwiftUI

struct MoodPicker: View {
    @Binding var selectedMood: Mood
    
    var body: some View {
        HStack(spacing: 30) {
            Button {
                selectedMood = .happy
            } label: {
                Text("😊")
                    .font(.largeTitle)
                    .padding()
                    .background(selectedMood == .happy ? Color.pink.opacity(0.3) : Color.gray.opacity(0.1))
                    .cornerRadius(30)
            }
            .buttonStyle(.plain)
            
            Button {
                selectedMood = .neutral
            } label: {
                Text("😐")
                    .font(.largeTitle)
                    .padding()
                    .background(selectedMood == .neutral ? Color.pink.opacity(0.3) : Color.gray.opacity(0.1))
                    .cornerRadius(30)
            }
            .buttonStyle(.plain)
            
            Button {
                selectedMood = .sad
            } label: {
                Text("😔")
                    .font(.largeTitle)
                    .padding()
                    .background(selectedMood == .sad ? Color.pink.opacity(0.3) : Color.gray.opacity(0.1))
                    .cornerRadius(30)
            }
            .buttonStyle(.plain)
        }
    }
}
