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
    @State var note: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Выбери настроение") {
                    MoodPicker(selectedMood: $selectedMood)
                        .padding(.vertical, 8)
                }
            }
            .navigationTitle("Новая запись")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Отмена") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Сохранить") {
                        viewModel.addEntry(mood: selectedMood)
                        dismiss()
                    }
                }
            }
        }
    }
}
