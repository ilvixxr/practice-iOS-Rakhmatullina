//
//  MoodViewModel.swift
//  MoodApp
//
//  Created by Ilvina on 01.07.2026.
//

import Foundation
import SwiftUI

@Observable
class MoodViewModel {
    var entries: [MoodEntry] = []
    
    func addEntry(mood: Mood) {
        let entry = MoodEntry(mood: mood)
        entries.append(entry)
    }
    
    func deleteEntry(at offsets: IndexSet) {
        entries.remove(atOffsets: offsets)
    }
}
