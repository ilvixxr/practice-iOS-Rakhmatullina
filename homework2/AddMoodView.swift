//
//  AddMoodView.swift
//  MoodApp
//
//  Created by Ilvina on 01.07.2026.
//

import SwiftUI

struct AddMoodView: View {
    @Environment(MoodViewModel.self) var viewModel
    @Environment(\.dismiss) var dismiss
    
    @State var selectedMood: Mood = .happy
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Новая запись")
                .font(.title)
                .padding(.top, 30)
            
            SectionCard(title: "Выбери настроение") {
                MoodPicker(selectedMood: $selectedMood)
            }
            
            PrimaryButton(title: "Сохранить") {
                viewModel.addEntry(mood: selectedMood)
                dismiss()
            }
            .padding(.horizontal)
            
            Spacer()
        }
    }
}
