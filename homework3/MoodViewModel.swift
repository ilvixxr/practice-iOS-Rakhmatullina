//
//  MoodViewModel.swift
//  MoodApp
//
//  Created by Ilvina on 01.07.2026.
//

import Foundation
import SwiftUI

enum ScreenState {
    case idle
    case loading
    case success
    case error(String)
}

@Observable
class MoodViewModel {
    var allEntries: [MoodEntry] = []
    var searchQuery: String = ""
    var state: ScreenState = .idle
    
    var filteredEntries: [MoodEntry] {
        if searchQuery.isEmpty {
            return allEntries
        }
        return allEntries.filter {
            $0.mood.rawValue.localizedCaseInsensitiveContains(searchQuery)
        }
    }
    
    func loadEntries() async {
        state = .loading
        do {
            if allEntries.isEmpty {
                let loadedEntries = try await MoodService.fetchEntries()
                allEntries = loadedEntries
            }
            state = .success
        } catch {
            state = .error("Ошибка загрузки")
        }
    }
    
    func addEntry(mood: Mood) {
        let entry = MoodEntry(mood: mood)
        allEntries.insert(entry , at: 0)
    }
    
    func deleteEntry(at offsets: IndexSet) {
        allEntries.remove(atOffsets: offsets)
    }
}
